#define NUM_LANGUAGES 6

#define LANG_DEFAULT 0
#define LANG_JAPANESE 1
#define LANG_ENGLISH 2
#define LANG_GERMAN 3
#define LANG_FRENCH 4
#define LANG_SPANISH 5
#define LANG_ITALIAN 6

#define LanguageIndex(lang) (lang - 1)

#define TextElementOffset(lang, elementsPerLang, element) (element + ((lang) * (elementsPerLang)))
#define TextElementOffsetAlt(lang, elementsPerLang, element) (((lang) * (elementsPerLang)) + element)

// TODO: move these to a better place

#define TextElementAlt(elementsPerLang, lang, element, a, b) [(lang) * (elementsPerLang) + (element - 1)] = { .unk0 = (a), .unk4 = (b), .unk6 = (element) }
#define TextElement(elementsPerLang, lang, element, a, b) [TextElementOffset(lang, elementsPerLang, element)] = { .unk0 = (a), .unk4 = (b), .unk6 = (element) }

#define TextElementAlt2(lang, element, a, b) [lang] = { .unk0 = (a), .unk4 = (b), .unk6 = (element) }
#define TextElementAlt3(element, a, b) [element] = { .unk0 = (a), .unk4 = (b), .unk6 = (element) }
#define TextElementAlt4(element, a, b) { .unk0 = (a), .unk4 = (b), .unk6 = (element) }
