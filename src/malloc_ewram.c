#if PORTABLE
#include <stdlib.h>
#endif
#include "global.h"
#include "core.h"
#include "malloc_ewram.h"

#define EWRAM_HEAP_SIZE 0x20080
EWRAM_DATA u8 gEwramHeap[EWRAM_HEAP_SIZE];

/* At the very beginning, there's only one node. */
void EwramInitHeap(void)
{
    struct EwramNode *root = (struct EwramNode *)&gEwramHeap[0];
    root->next = NULL;
    root->state = sizeof(gEwramHeap);
}

// TEMP: EwramMalloc/Free can crash right now
//       (Maybe because of DMAs?)
void *EwramMalloc(u32 req)
{
#if PORTABLE
    if (req == 0) {
        return NULL;
    }

    return calloc(req, 1);
#else
    struct EwramNode *node;
    s32 requestedSpace = req;

    requestedSpace = (req + 3) / 4; // round up and get word count
    if (requestedSpace != 0) {
        requestedSpace = requestedSpace * 4 + sizeof(struct EwramNode);
        node = (struct EwramNode *)gEwramHeap;
        /* linear search */
        while (1) {
            if (requestedSpace <= (u32)node->state) {
                /*
                 * Space corresponding to the node matches requested size.
                 * This means, we can directly use this node for the request
                 * w/o any adjustment.
                 */
                if (requestedSpace == node->state) {
                    node->state = -requestedSpace; // busy
                    return node->space;
                }

                /*
                 * Node has too much space.
                 * This means, we need to construct a new node so that space won't
                 * get wasted.
                 */
                if (requestedSpace + (s32)sizeof(struct EwramNode) <= node->state) {
                    struct EwramNode *addr = (void *)node + requestedSpace;

                    addr->next = node->next;
                    ++node;
                    --node;
                    addr->state = node->state - requestedSpace; // Surplus space belongs to the new node.
                    node->next = addr;
                    node->state = -requestedSpace; // busy
                    return node->space;
                }
            }
            ++requestedSpace;
            --requestedSpace;
            if (!node->next)
                return ewram_end;
            node = node->next;
        }
    }
    return ewram_end;
#endif
}

void EwramFree(void *p)
{
#if PORTABLE
    if (p != NULL) {
        free(p);
    }
#else
    struct EwramNode *node, *slow, *fast, *tmp;

    if (p && ewram_end != p) {
        node = p - offsetof(struct EwramNode, space);

        /* find parent of node */
        for (fast = slow = (struct EwramNode *)gEwramHeap; node != fast; fast = fast->next)
            slow = fast;

        if (node->state < 0) // It should always be true if the function is called properly.
            node->state = -node->state; // free

        /*
         * Parent node and child node are adjacent.
         * In this case we simply merge child into parent.
         */
        if ((void *)slow + slow->state == node && slow->state > 0) {
            slow->next = fast->next;
            slow->state += node->state;
            node = slow;
        }

        /*
         * Similar to above check, but different direction.
         * Merge if the next node is adjacent.
         */
        tmp = (void *)node + node->state;
        if (tmp == node->next && tmp->state > 0) {
            node->state += tmp->state;
            node->next = tmp->next;
        }
    }
#endif
}
