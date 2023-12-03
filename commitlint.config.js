module.exports = {
  extends: ["@commitlint/config-conventional"],
  ignores: [(message) => /^Bumps \[(.+)\]\((.+)\)(.*).$/m.test(message)],
};
