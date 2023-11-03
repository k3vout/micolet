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
        'primary-light': '#1FB9E3',
        'secondary': '#5A6780',
        'secondary-light': '#1881B2'
      },
      fontFamily: {
        sans: ['Roboto']
      },
    },
  }
}
