Load external JS from bookmarklet
sample code via: https://stackoverflow.com/questions/106425/load-external-js-from-bookmarklet

javascript:(function(){document.body.appendChild(document.createElement('script')).src='** your external file URL here **';})();
