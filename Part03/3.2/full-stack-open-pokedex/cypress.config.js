/* eslint-disable linebreak-style */
const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    baseUrl: 'http://localhost:5000',
    supportFile: false, // optional if not using custom support
    specPattern: 'cypress/e2e/**/*.cy.js',
  },
})
