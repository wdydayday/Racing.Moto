/** * @author Paul Chan / KF Software House  * http://www.kfsoft.info * * Version 0.5 * Copyright (c) 2010 KF Software House * * Licensed under the MIT license: * http://www.opensource.org/licenses/mit-license.php * */(function ($) {
    var _options = new Array();    jQuery.fn.MyFloatingBg = function (options) {
        _options[_options.length] = $.extend({}, $.fn.MyFloatingBg.defaults, options);        var idx = _options.length - 1;        var opt = _options[idx];        $(this).attr("idx", idx);        var direction = -1;        if (opt.direction == -1)            direction = getDirection();        else            direction = opt.direction;        var sign1 = "+";        var sign2 = "+";        if (direction == 0) {
            sign1 = "+";            sign2 = "-";
        }        else if (direction == 1) {
            sign1 = "-";            sign2 = "+";
        }        else if (direction == 2) {
            sign1 = "+";            sign2 = "+";
        }        else if (direction == 3) {
            sign1 = "-";            sign2 = "-";
        }        else if (direction == 4) {//left
            sign1 = "-";            sign2 = "";
        }        else if (direction == 5) {//right
            sign1 = "+";            sign2 = "";
        }        else if (direction == 6) {//up
            sign1 = "";            sign2 = "+";
        }        else if (direction == 7) {//right
            sign1 = "";            sign2 = "-";
        }        $(this).each(function () {
            var bg = $(this).attr("bg");            $(this).css("background", "url('" + bg + "')");            $(this).attr("sign1", sign1);            $(this).attr("sign2", sign2);            $(this).attr("cnt", 1);            doShift($(this));
        });
    }    function doShift(o) {
        var idx = $(o).attr("idx");        var opt = _options[idx];        setTimeout(function () {
            var cnt = $(o).attr("cnt");            if (cnt > 1000)                cnt = 0;            else                cnt = eval(cnt) + 1;            $(o).attr("cnt", cnt);            var sign1 = $(o).attr("sign1");            var sign2 = $(o).attr("sign2");            if (sign1 != "" && sign2 != "") {
                o.css("backgroundPosition", sign1 + cnt + "px" + " " + sign2 + cnt + "px");
            }            else if (sign1 == "") {
                o.css("backgroundPosition", "0px" + " " + sign2 + cnt + "px");
            }            else if (sign2 == "") {
                o.css("backgroundPosition", sign1 + cnt + "px" + " " + "0px");
            }            doShift(o);
        }, opt.speed);
    }    function getDirection() {
        return Math.floor(Math.random() * 4)
    }    //default values    jQuery.fn.MyFloatingBg.defaults = {
        speed: 50,        direction: -1
    };
})(jQuery);