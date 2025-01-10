const headings = [
  "key",
  "time",
  "commit",
  "bytes",
  "totalBytes",
  "dataBytes",
  "dataTotalBytes",
];

const fetchReport = async (path) => {
  const reportCsv = await (await fetch(path)).text();
  return reportCsv
    .split("\n")
    .filter(Boolean)
    .map((line) =>
      Object.fromEntries(
        line.split(",").map((value, i) => [headings[i], value])
      )
    )
    .map((item) => ({
      ...item,
      time: new Date(parseInt(item.time * 1000)).toISOString(),
    }));
};

window.onload = async () => {
  const [nonMatchingData, matchingData] = await Promise.all([
    fetchReport("./reports/progress-sa2-nonmatching.csv"),
    fetchReport("./reports/progress-sa2-matching.csv"),
  ]);

  const ctx = document.getElementById("progress-chart").getContext("2d");
  const myChart = new Chart(ctx, {
    type: "line",
    data: {
      datasets: [
        {
          label: "Decompiled",
          data: nonMatchingData.map((item) => ({
            x: item.time,
            y: item.bytes / item.totalBytes,
            commit: item.commit,
          })),
          borderColor: "rgb(75, 192, 192)",
        },
        {
          label: "Matching",
          data: matchingData.map((item) => ({
            x: item.time,
            y: item.bytes / item.totalBytes,
            commit: item.commit,
          })),
          borderColor: "#23ff00",
        },
      ],
    },
    options: {
      interaction: {
        mode: "index",
        axis: "y",
      },
      scales: {
        y: {
          min: 0,
          ticks: {
            format: {
              style: "percent",
            },
          },
          precision: 2,
        },
        x: {
          type: "time",
          time: {
            unit: "month",
          },
          // time: {
          //   displayFormats: {
          //       quarter: 'MMM YYYY'
          //     }
          // }
        },
      },
    },
  });
};
