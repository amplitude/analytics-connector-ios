module.exports = {
  "branches": ["main"],
  "plugins": [
    ["@semantic-release/commit-analyzer", {
      "preset": "angular",
      "parserOpts": {
        "noteKeywords": ["BREAKING CHANGE", "BREAKING CHANGES", "BREAKING"]
      }
    }],
    ["@semantic-release/release-notes-generator", {
      "preset": "angular",
    }],
    ["@semantic-release/changelog", {
      "changelogFile": "CHANGELOG.md"
    }],
    [
      "@semantic-release/github", {
        "assets": [
          { "path": ".build/artifacts/AnalyticsConnector.xcframework.zip" },
        ]
    }],
    [
      "@google/semantic-release-replace-plugin",
      {
        "replacements": [
          {
            "files": ["AnalyticsConnector.podspec"],
            "from": "analytics_connector_version = \".*\"",
            "to": "analytics_connector_version = \"${nextRelease.version}\"",
            "results": [
              {
                "file": "AnalyticsConnector.podspec",
                "hasChanged": true,
                "numMatches": 1,
                "numReplacements": 1
              }
            ],
            "countMatches": true
          },
          {
            "files": ["Package.swift"],
            "from": "https://github.com/amplitude/analytics-connector-ios/releases/download/v.*/AnalyticsConnector.xcframework.zip",
            "to": "https://github.com/amplitude/analytics-connector-ios/releases/download/v${nextRelease.version}/AnalyticsConnector.xcframework.zip",
            "results": [
              {
                "file": "Package.swift",
                "hasChanged": true,
                "numMatches": 1,
                "numReplacements": 1
              }
            ],
            "countMatches": true
          },
          {
            "files": ["Package@swift-5.9.swift"],
            "from": "https://github.com/amplitude/analytics-connector-ios/releases/download/v.*/AnalyticsConnector.xcframework.zip",
            "to": "https://github.com/amplitude/analytics-connector-ios/releases/download/v${nextRelease.version}/AnalyticsConnector.xcframework.zip",
            "results": [
              {
                "file": "Package@swift-5.9.swift",
                "hasChanged": true,
                "numMatches": 1,
                "numReplacements": 1
              }
            ],
            "countMatches": true
          },
        ]
      }
    ],
    ["@semantic-release/git", {
      "assets": ["AnalyticsConnector.podspec", "CHANGELOG.md", "Package.swift", "Package@swift-5.9.swift"],
      "message": "chore(release): ${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"
    }],
    ["@semantic-release/exec", {
      "publishCmd": "pod trunk push AnalyticsConnector.podspec --allow-warnings",
    }],
  ],
}
