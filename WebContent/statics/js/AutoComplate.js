
(function($) {
    var itemIndex = 0;
    var curId = '11';
    $.fn.autoSearchText = function(options) {
        //以下为该插件的属性及其默认值   
        var deafult = { width: 200,           //文本框宽 
            itemHeight: 150,      // 下拉框高 11           
            minChar: 1,            //最小字符数(从第几个开始搜索) 12     
            datafn: null,         //加载数据函数 13       
            fn: null             //选择项后触发的回调函数 14    
        };
        var textDefault = $(this).val();
        var ops = $.extend(deafult, options);
        $(this).width(ops.width);
        curId = $(this).attr("id");
        var autoSearchItem = '<div id="autoSearchItem' + curId + '" class="autoSearchItem"><ul class="menu_v"></ul></div>';
        $(this).after(autoSearchItem);


        $('#autoSearchItem' + curId).width(ops.width + 2); //设置项宽 22  
        $('#autoSearchItem' + curId).height(ops.itemHeight); //设置项高 23  24  
        $(this).focus(function() {
            if ($(this).val() == textDefault) {
                //$(this).val('');//获得焦点时清空已有值
                $(this).css('color', 'black');
            }
        });
        var itemCount = $('li').length; //项个数 31         /*鼠标按下键时，显示下拉框，并且划过项时改变背景色及赋值给输入框*/ 32

        $(this).bind('keyup', function(e) {
            if ($(this).val().length >= ops.minChar) {
                var position = $(this).position();
                $('#autoSearchItem' + $(this).attr("id")).css({ 'visibility': 'visible', 'left': position.left, 'top': position.top + 24 });
                if (e.keyCode == 38 || e.keyCode == 40 || e.keyCode == 13) {
                    if ($(this).val() == "" && (e.keyCode == 38 || e.keyCode == 40)) {
                        var data = ops.datafn($(this).val());
                        initItem($(this), data, ops);
                    }
                }
                else {
                    var data = ops.datafn($(this).val());
                    initItem($(this), data, ops);
                }
                var lis = $('#autoSearchItem' + $(this).attr("id")).find("li");
                var itemCount = lis.length;
                itemIndex = -1;
                for (var i = 0; i < itemCount; i++) {
                    if ($(lis[i]).find("p").html() == "1") {
                        itemIndex = i;
                    }
                    //去掉选中状态
                    $(lis[itemIndex]).css({ 'background': 'white', 'color': 'black' });
                    $(lis[i]).find("p").html("0");
                }
                switch (e.keyCode) {
                    case 38:
                        { //上 41
                            //没有选中项状态下,按上或按下都选中第一个
                            if (itemIndex == -1) {
                                itemIndex = 0;
                            } else {
                                itemIndex--;
                                //如果选中的是第一个,则继续按上跳到最后一个去
                                if (itemIndex < 0) {
                                    itemIndex = itemCount - 1;
                                }
                            }
                            $(lis[itemIndex]).css({ 'background': 'blue', 'color': 'white' });
                            $(lis[itemIndex]).find("p").html("1"); //是否选中标识
                            break;
                        }
                    case 40:
                        {//下 48
                            //没有选中项状态下,按上或按下都选中第一个
                            if (itemIndex == -1) {
                                itemIndex = 0;
                            } else {
                                itemIndex++;
                                //如果选中的是最后一个,继续按下则跳到第一个去
                                if (itemIndex >= itemCount) {
                                    itemIndex = 0;
                                }
                            }

                            $(lis[itemIndex]).css({ 'background': 'blue', 'color': 'white' });
                            $(lis[itemIndex]).find("p").html("1"); //是否选中标识
                            break;
                        }
                    case 13:
                        {//Enter 55
                            if (itemIndex == -1) {
                                itemIndex = 0;
                                $(lis[itemIndex]).css({ 'background': 'blue', 'color': 'white' });
                                $(lis[itemIndex]).find("p").html("1"); //是否选中标识
                            }
                            $(this).val($(lis[itemIndex]).find("font").text())
                            $('.autoSearchItem').css('visibility', 'hidden');
                            ops.fn($(lis[itemIndex]).find("input").val())
                            break;
                        }
                    default:
                        break;

                }


            }
        });
        /*点击空白处隐藏下拉框*/
        $(document).click(function() {
            $('.autoSearchItem').css('visibility', 'hidden');
        });
    };
    /*获取文本框的值*/
    $.fn.getValue = function() {
        return $(this).val();
    };

    /*初始化下拉框数据,鼠标移过每项时，改变背景色并且将项的值赋值给输入框*/
    function initItem(obj, data, options) {
        var str = "";
        if (data.length == 0) {

            $('#autoSearchItem' + $(obj).attr("id") + ' ul').html('<div style="text-align:center;color:red;">无符合数据<div>');
        }
        else {
            for (var i = 1; i <= data.length; i++) {
                var newData = data[i - 1].split("|");
                if (i == 1) {
                    //$(obj).val(newData[1]);
                }
                for (var j = 0; j < newData.length; j++) {
                    if (j == 0) {
                        str += "<li><p style=\"display:none\">0</p>";

                    }
                    else if (j == 1) {
                        str += "<font>" + newData[j] + "</font>\r";
                    }
                    if (j == newData.length - 1) {
                        str += "<input type='hidden' value='" + newData[0] + "' /><span>" + newData[j] + "</span></li>";
                    }
                    if (j > 1 && j < newData.length - 1) {
                        str += "<span>" + newData[j] + "</span>\r";
                    }
                }

            }
            $('#autoSearchItem' + $(obj).attr("id") + ' ul').html(str);
            $('#autoSearchItem' + $(obj).attr("id")).find("li").each(function() {
                $(this).bind('click', function() {
                    obj.val($(this).find('font').text());
                    //$(this).parent().ops.fn($(this).find('input').val());
                    options.fn($(this).find('input').val());
                    $('.autoSearchItem').css('visibility', 'hidden');

                });
            });
        }
        /*鼠标划过每项时改变背景色*/
        $('li').each(function() {
            $(this).hover(function() {
                $(this).css({ 'background': 'blue', 'color': 'white' });
                $(this).find("p").html("1");
            }, function() {
                $(this).css({ 'background': 'white', 'color': 'black' });
                $(this).find("p").html("0");
            }
                                                                                                                      );
        });
    };
})(jQuery);