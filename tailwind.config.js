module.exports = {
  content: [
    "./storage/framework/views/*.php",
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
  ],
  theme: {
    container: {
      center: true,
      padding: '16px',
    },
    extend: {
      colors: {
        primary: '#0D9488',
        dark: '#1E293B',
        secondary: '#64748B',
      },
      screen: {
        '2xl' : '1320px',
      },
    },
  },
  plugins: [],
}
