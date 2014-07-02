// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

/*
ThatsNotYoChild.js, by Louis Lazaris
Explanation: http://www.impressivewebs.com/fixing-parent-child-opacity/
This is a hacky workaround to let you use opacity on any element and prevent the child elements from inheriting the opacity.
Works in IE8+.
If anyone can get line 23 working in IE7, it will be fully cross-browser.
*/
function thatsNotYoChild(parentID) {

    var parent           = document.getElementById(parentID),
        children         = parent.innerHTML,
        wrappedChildren  = '<div id="children" class="children">' + children + '</div>',
        x, y, w, newParent, clonedChild, clonedChildOld;

    parent.innerHTML = wrappedChildren;
    clonedChild = document.getElementById('children').cloneNode(true);
    document.getElementById('children').id = 'children-old';
    clonedChildOld = document.getElementById('children-old');
    newParent = parent.parentNode;

    newParent.appendChild(clonedChild);
    clonedChildOld.style.opacity = '0';
    clonedChildOld.style.filter = 'alpha(opacity=0)';

    function doCoords () {
      x = clonedChildOld.getBoundingClientRect().left;
      y = clonedChildOld.getBoundingClientRect().top;
      if (clonedChildOld.getBoundingClientRect().width) {
        w = clonedChildOld.getBoundingClientRect().width; // for modern browsers
      } else {
        w = clonedChildOld.offsetWidth; // for oldIE
      }

      clonedChild.style.position = 'absolute';
      clonedChild.style.left = x + 'px';
      clonedChild.style.top = y + 'px';
      clonedChild.style.width = w + 'px';
    }

    window.onresize = function () {

      doCoords();

    };

    doCoords();

}

// call the function and pass the ID of the parent that has opacity set.
thatsNotYoChild('parent');
