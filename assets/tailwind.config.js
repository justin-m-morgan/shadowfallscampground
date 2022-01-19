const colors = require("tailwindcss/colors");
const typography = require("@tailwindcss/typography");
const forms = require("@tailwindcss/forms");

module.exports = {
  content: ["./js/**/*.js", "../lib/*_web/**/*.*ex", "../lib/*_web/**/*.sface"],
  theme: {
    extend: {
      colors: {
        primary: colors.green,
        accent: colors.purple,
      },
      backgroundImage: {
        trees: "url(/images/pexels-brandon-montrone-1179229--narrow_1200.jpg)",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [typography, forms],
};
