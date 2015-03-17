(function () {
  'use strict';

  var hamburger_trigger, viewArea, oldScrollLocation;

  viewArea = 860;
  oldScrollLocation = 0;

  function hasClass(el, cls) {
    return el.className && new RegExp("(\\s|^)" + cls + "(\\s|$)").test(el.className);
  }

  function addClass(el, cls) {
    if (!hasClass(el, cls)) {
      el.className = el.className.trim() + " " + cls;
    }
  }

  function removeClass(el, cls) {
    var re = new RegExp("(\\s|^)" + cls + "(\\s|$)");
    el.className = el.className.trim().replace(re, ' ');
  }

  function toggleClass(el, cls) {
    if (hasClass(el, cls)) {
      removeClass(el, cls);
    } else {
      addClass(el, cls);
    }
  }

  hamburger_trigger = document.querySelector(".hamburger-trigger");
  hamburger_trigger.addEventListener("click", function () {
    var body, header_main_nav;

    body = document.body;
    header_main_nav = document.querySelector(".header-main-nav-container");

    toggleClass(this, 'active');
    toggleClass(body, 'overflow-hidden');
    toggleClass(header_main_nav, 'is-visible');
  });

  window.onscroll = function () {
    var newScrollLocation, siteHeader, siteHeaderHeight;

    if (window.innerWidth > viewArea) {
      siteHeader = document.querySelector(".site-header-hamburger");
      siteHeaderHeight = siteHeader.clientHeight;
      newScrollLocation = window.pageYOffset;

      if (newScrollLocation < oldScrollLocation) {//scrolling up
        if (newScrollLocation > 0 && hasClass(siteHeader, 'is-fixed')) {
          addClass(siteHeader, 'is-visible');
        } else {
          removeClass(siteHeader, 'is-visible');
          removeClass(siteHeader, 'is-fixed');
        }
      } else {//scrolling down
        removeClass(siteHeader, 'is-visible');

        if (newScrollLocation > siteHeaderHeight && !hasClass(siteHeader, 'is-fixed')) {
          addClass(siteHeader, 'is-fixed');
        }
      }

      oldScrollLocation = newScrollLocation;
    }
  };
}());
