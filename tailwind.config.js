module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        'primary': '#66CC99',
        'secondary': '#5A6780'
      },
      fontFamily: {
        sans: ['Roboto']
      },
    },
  }
}
