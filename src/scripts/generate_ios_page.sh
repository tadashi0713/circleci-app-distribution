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
      <div class="columns is-mobile">
        <div class="column is-half is-offset-one-quarter">
          <h1 class="title has-text-centered">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 100" width="126" class="css-1yqyrw2">
              <circle fill="#161616" cx="30.44" cy="52.5" r="7.471"></circle>
              <path fill="#161616" d="M30.44 21.124c-14.619 0-26.903 10-30.388 23.532-.03.119-.052.244-.052.373 0 .825.669 1.494 1.494 1.494h12.651c.603 0 1.118-.358 1.354-.873 0 0 .019-.035.025-.052 2.608-5.628 8.304-9.533 14.914-9.533 9.077 0 16.436 7.357 16.436 16.435S39.517 68.935 30.44 68.935c-6.61 0-12.305-3.905-14.914-9.532-.007-.018-.026-.053-.026-.053a1.489 1.489 0 0 0-1.354-.873H1.495c-.826 0-1.495.669-1.495 1.494 0 .129.021.254.052.373C3.537 73.876 15.821 83.876 30.44 83.876c17.329 0 31.376-14.048 31.376-31.376S47.769 21.124 30.44 21.124zM112.482 59.855h-4.268a.919.919 0 0 0-.729.361c-2.479 3.664-6.671 6.074-11.428 6.074-7.617 0-13.791-6.175-13.791-13.791 0-7.617 6.174-13.792 13.791-13.792 4.758 0 8.949 2.412 11.429 6.075a.916.916 0 0 0 .728.361h4.268a.92.92 0 0 0 .921-.919.91.91 0 0 0-.101-.413c-3.18-6.299-9.706-10.621-17.244-10.621-10.663 0-19.309 8.645-19.309 19.309 0 10.663 8.646 19.309 19.309 19.309 7.538 0 14.064-4.322 17.243-10.621a.914.914 0 0 0 .102-.413.92.92 0 0 0-.921-.919zM125.355 26.756a3.678 3.678 0 1 1-7.357 0 3.678 3.678 0 0 1 7.357 0zm-.919 43.213V34.11h-5.517v35.858a.92.92 0 0 0 .919.919h3.679a.918.918 0 0 0 .919-.918zM148.355 33.214c-5.564.262-10.008 2.921-12.887 6.981v-5.166a.92.92 0 0 0-.919-.919h-3.678a.92.92 0 0 0-.919.919v34.939c0 .508.41.919.919.919h3.678a.918.918 0 0 0 .919-.919V52.5c0-7.308 5.686-13.286 12.871-13.76a.921.921 0 0 0 .921-.922v-3.686a.92.92 0 0 0-.905-.918zM184.992 59.855h-4.268a.916.916 0 0 0-.729.361c-2.479 3.664-6.671 6.074-11.427 6.074-7.618 0-13.792-6.175-13.792-13.791 0-7.617 6.174-13.792 13.792-13.792 4.756 0 8.948 2.412 11.427 6.075a.917.917 0 0 0 .729.361h4.268a.92.92 0 0 0 .921-.919.898.898 0 0 0-.102-.413c-3.179-6.299-9.705-10.621-17.242-10.621-10.664 0-19.309 8.645-19.309 19.309 0 10.663 8.645 19.309 19.309 19.309 7.537 0 14.063-4.322 17.242-10.621a.914.914 0 0 0 .102-.413.92.92 0 0 0-.921-.919zM196.025 22.158h-3.678a.92.92 0 0 0-.919.919v46.892c0 .508.411.919.919.919h3.678a.92.92 0 0 0 .92-.919V23.077a.92.92 0 0 0-.92-.919zM221.771 33.191c-10.664 0-19.309 8.645-19.309 19.309 0 10.663 8.645 19.309 19.309 19.309 7.538 0 14.062-4.322 17.242-10.621a.913.913 0 0 0-.819-1.332h-4.267a.913.913 0 0 0-.741.379c-2.48 3.653-6.666 6.057-11.415 6.057-6.993 0-12.767-5.206-13.667-11.952h32.031a.92.92 0 0 0 .917-.873c.016-.32.026-.643.026-.966 0-10.665-8.644-19.31-19.307-19.31zm-13.292 15.631c1.61-5.83 6.949-10.114 13.292-10.114s11.681 4.284 13.292 10.114h-26.584zM294.483 21.239a5.517 5.517 0 1 0 0 11.034 5.517 5.517 0 0 0 0-11.034zm4.598 12.871v35.858a.92.92 0 0 1-.919.919h-7.356a.918.918 0 0 1-.919-.919V34.11h9.194zM265.902 71.809c9.014 0 16.576-6.176 18.706-14.524a.832.832 0 0 0 .023-.187.92.92 0 0 0-.919-.92h-7.782a.919.919 0 0 0-.834.537l-.002-.001c-1.599 3.48-5.11 5.899-9.192 5.899-5.584 0-10.113-4.527-10.113-10.113s4.529-10.113 10.113-10.113a10.11 10.11 0 0 1 9.192 5.899l.002-.002a.92.92 0 0 0 .834.538h7.782a.92.92 0 0 0 .919-.92.944.944 0 0 0-.022-.184c-2.128-8.35-9.693-14.527-18.707-14.527-10.661 0-19.308 8.646-19.308 19.309.001 10.664 8.647 19.309 19.308 19.309z"></path>
            </svg>
            App Distribution
          </h1>
          <table class="table is-fullwidth">
            <tbody>
              <tr>
                <th>Build URL</th>
                <td>
                  <a href="${CIRCLE_BUILD_URL}">$CIRCLE_BUILD_URL</a>
                </td>
              </tr>
              <tr>
                <th>Branch</th>
                <td>$CIRCLE_BRANCH</td>
              </tr>
            </tbody>
          </table>
          <div class="has-text-centered">
            <a class="button is-dark has-text-centered is-large" href="${APP_URL}">Download App</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  </body>
</html>
_EOF_