#!/bin/bash

# Fetch App Data
APP_DATA=$("${ANDROID_HOME}"/build-tools/"${BUILD_TOOLS_VERSION}"/aapt2 dump badging "${APP_PATH:-default}")

# Convert app data to Env
APP_NAME=$(echo "${APP_DATA}" | grep "application: label=" | sed -e "s/.*application: label='//" -e "s/' .*//")
RELEASE_VERSION=$(echo "${APP_DATA}" | grep "versionName" | sed -e "s/.*versionName='//" -e "s/' .*//")
BUILD_VERSION=$(echo "${APP_DATA}" | grep "versionCode" | sed -e "s/.*versionCode='//" -e "s/' .*//")
IDENTIFIER=$(echo "${APP_DATA}" | grep "package: name" | sed -e "s/.*package: name='//" -e "s/' .*//")

# Generate page
APP_URL="https://output.circle-artifacts.com/output/job/${CIRCLE_WORKFLOW_JOB_ID}/artifacts/0/${APP_PATH}"

cat > index.html <<- _EOF_
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CircleCI App Distribution</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <link href="https://use.fontawesome.com/releases/v6.5.1/css/all.css" rel="stylesheet">
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
        <div class="columns">
          <div class="column">
            <h1 class="title has-text-centered">
              CircleCI App Distribution
            </h1>
            <div class="table-container">
              <table class="table is-fullwidth">
                <tbody>
                  <tr>
                    <th>Build URL</th>
                    <td>
                      <a href="${CIRCLE_BUILD_URL}">${CIRCLE_BUILD_NUM}</a>
                    </td>
                  </tr>
                  <tr>
                    <th>Branch</th>
                    <td>${CIRCLE_BRANCH}</td>
                  </tr>
                  <tr>
                    <th>Name</th>
                    <td>${APP_NAME}</td>
                  </tr>
                  <tr>
                    <th>ReleaseVersion</th>
                    <td>${RELEASE_VERSION}</td>
                  </tr>
                  <tr>
                    <th>BuildVersion</th>
                    <td>${BUILD_VERSION}</td>
                  </tr>
                  <tr>
                    <th>Identifier</th>
                    <td>${IDENTIFIER}</td>
                  </tr>
                  <tr>
                    <th>Release Note</th>
                    <td>${RELEASE_NOTE}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="field is-grouped is-grouped-centered">
              <p class="control">
                <a class="button is-dark" href="${APP_URL}">
                  <span class="icon">
                    <i class="fas fa-download"></i>
                  </span>
                  <span>Install App</span>
                </a>
              </p>
              <p class="control">
                <button class="button" onclick="copyToClipboard()">
                  <span class="icon">
                    <i class="fas fa-copy"></i>
                  </span>
                  <span>Copy URL</span>
                </button>
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <script>
      function copyToClipboard(text) {
        var inputc = document.body.appendChild(document.createElement("input"));
        inputc.value = window.location.href;
        inputc.focus();
        inputc.select();
        document.execCommand('copy');
        inputc.parentNode.removeChild(inputc);
        alert("URL Copied.");
      }
    </script>
  </body>
</html>
_EOF_
