#!/bin/bash

cat > page.html <<- _EOF_
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CircleCI App Distribution</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link rel="apple-touch-icon" sizes="180x180" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/apple-touch-icon-f1ef1fb6f37fe36fdacd2dfdc11fb2edf1720083a9aa8648eeac81f0a69e8da8.png">
    <link rel="icon" type="image/png" sizes="512x512" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/android-chrome-512x512-636549fcf54150d3184aa6e8395d79ca9bcdc9278210e947ce093372cc2004a4.png">
    <link rel="icon" type="image/png" sizes="192x192" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/android-chrome-192x192-daa316a62fc466bc7bbff9118d8bd8a358c4b1d934629eedc0e5b87c9bf6a6f0.png">
    <link rel="icon" type="image/png" sizes="150x150" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/android-chrome-192x192-daa316a62fc466bc7bbff9118d8bd8a358c4b1d934629eedc0e5b87c9bf6a6f0.png">
    <link rel="icon" type="image/png" sizes="32x32" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/favicon-32x32-86c07d561af62a6d412c5465d401ebf50a8f304d97c165e30feb71868b891c7c.png">
    <link rel="icon" type="image/png" sizes="16x16" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/favicon-16x16-2f395f301d4ee767c0016c98f97561dc2ec4ddbae39cc895c9840a22467df08a.png">
    <link rel="manifest" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/site-90f0e3ca8a56223e86328049af75ddd9e6e4a6fdac600d0773f54f95e531f0cd.webmanifest">
    <link rel="mask-icon" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/safari-pinned-tab-251836a3ead2fbbebdd673dd680e8b01f1d8e5889cb3641a16893ad344f17d4a.svg" color="#04aa51">
    <link rel="shortcut icon" href="https://d3r49iyjzglexf.cloudfront.net/blog/meta/favicon-7821a60418a7ee3a7570d938fb95e809903dbfca7514b9245f1beef5d00da2d8.ico">
    <meta name="apple-mobile-web-app-title" content="CircleCI App Distribution">
    <meta name="application-name" content="CircleCI App Distribution">
    <meta name="msapplication-square150x150logo" content="https://d3r49iyjzglexf.cloudfront.net/blog/meta/mstile-150x150-e0e68b19614d1b594800947225d05483564336ec629d74afb53cf3fe9d634d2a.png">
    <meta name="theme-color" content="#ffffff">
  </head>
  <body>
  <section class="section">
    <div class="container">
      <h1 class="title has-text-centered">
        CircleCI App Distribution
      </h1>
      <table class="table">
        <thead>
          <tr>
            <th><abbr title="Position">Pos</abbr></th>
            <th>Team</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th>1</th>
            <td><a href="https://en.wikipedia.org/wiki/Leicester_City_F.C." title="Leicester City F.C.">Leicester City</a> <strong>(C)</strong>
            </td>
          </tr>
          <tr>
            <th>2</th>
            <td><a href="https://en.wikipedia.org/wiki/Arsenal_F.C." title="Arsenal F.C.">Arsenal</a></td>
          </tr>
          <tr>
            <th>3</th>
            <td><a href="https://en.wikipedia.org/wiki/Tottenham_Hotspur_F.C." title="Tottenham Hotspur F.C.">Tottenham Hotspur</a></td>
          </tr>
        </tbody>
      </table>
      <a class="button is-dark has-text-centered" href="${ARTIFACT_URL}">Download</a>
    </div>
  </section>
  </body>
</html>
_EOF_
