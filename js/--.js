javascript:(function(){
var e,s; IB=-1; function isDigit(c) { return ("0" <= c && c <= "9") } L = location.href;
LL = L.length; for (e=LL-1; e>=0; --e) if (isDigit(L.charAt(e))) { for(s=e-1; s>=0; --s) if (!isDigit(L.charAt(s))) break;
break; } ++s; if (e<0) return; oldNum = L.substring(s,e+1);
newNum = "" + (parseInt(oldNum,10) + IB); while (newNum.length < oldNum.length) newNum = "0" + newNum;
location.href = L.substring(0,s) + newNum + L.slice(e+1);
})();
