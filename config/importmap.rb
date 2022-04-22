# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "@serviceworker", to: "/serviceworker.js", preload: true

pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "https://ga.jspm.io/npm:three@0.139.2/build/three.module.js", under: "three"

pin "three", to: "https://ga.jspm.io/npm:three@0.139.2/build/three.module.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js"

