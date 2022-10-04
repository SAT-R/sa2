const headings = [
  "key",
  "time",
  "commit",
  "bytes",
  "totalBytes",
  "dataBytes",
  "dataTotalBytes",
];
window.onload = async () => {
  const reportCsv = await (
    await fetch("./reports/progress-sa2-nonmatching.csv")
  ).text();
  let matchingData = reportCsv
    .split("\n")
    .filter(Boolean)
    .map((line) =>
      Object.fromEntries(
        line.split(",").map((value, i) => [headings[i], value])
      )
    );
  
  matchingData = matchingData.map((item) => ({
    ...item,
    time: new Date(parseInt(item.time * 1000)).toISOString(),
  }));

  const ctx = document.getElementById("progress-chart").getContext("2d");
  const myChart = new Chart(ctx, {
    type: "line",
    data: {
      datasets: [
        {
          label: "Decompiled",
          data: matchingData.map((item) => ({
            x: item.time,
            y: (item.bytes / item.totalBytes),
            commit: item.commit
          })),
          borderColor: 'rgb(75, 192, 192)',
        },
      ],
    },
    options: {
      interaction: {
        mode: 'index',
        axis: 'y'
    },
      scales: {
        
        y: {
          min: 0,
          ticks: {
                format: {
                    style: 'percent'
                }
            },
            precision: 2,
        },
        x: {
          type: "time",
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
