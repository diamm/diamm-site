/**
 * Created by IntelliJ IDEA.
 * User: Elliot
 * Date: 20/03/12
 * Time: 13:03
 * To change this template use File | Settings | File Templates.
 */

 //Courtesy of http://plugins.jquery.com/project/delayer
        function delayTimer(delay) {
            var timer;
            return function(fn) {
                timer = clearTimeout(timer);
                if (fn)
                    timer = setTimeout(function() {
                        fn();
                    }, delay);
                return timer;
            };
        }
        var inputDelayer = delayTimer(500);
        getAutoComplete = function(input) {
            var id = $(input).attr('name').replace('criteriaInput', '');
            var itemType = $('#criteriaType' + id).val();
            var search = $(input).val();
            if (search.length > 1) {
                $.get("SearchManager", {op:2,iid:id,itemType:itemType,search:search}, function(data) {
                    $('#complete' + id).html(data);
                });
            }
        };

        validate = function() {
            var reject = 1;
            for (var i = 1; i <=maxCriteria; i++) {
                var itemType = $('#criteriaType' + i).val();

                if ($('#criteriaInput' + i).val().length > 0) {
                    reject = 0;
                    break;
                } else if (itemType.indexOf('DESCRIPTION') == 0 || itemType.indexOf('TEXT') == 0) {
                    if ($('#criteriaInput' + i).val().length > 0) {
                        reject = 0;
                        break;
                    }
                }
            }
            if (reject == 1) {
                alert('Select Criteria First');
            }
            return reject;
        };

        resetCriteria = function(id) {
            $('#value' + id).val('');
            $('#criteriaInput' + id).val('');
			/* clear autocomplete icon */

        };

        redrawCriteria = function(id) {
            var itemType = $('#criteriaType' + id).val();
            if (itemType.indexOf('DATE') > -1) {
                $('#criteriaInput' + id).remove();
                $('#c' + id).append('<label for="century1" id="century1Label">Start Date</label>');
                $('#c' + id).append('<select name="century1" id="century1' + id + '">');
                $('#c' + id).append('<label for="century2" id="century2Label">End Date</label>');
                $('#c' + id).append('<select name="century2" id="century2' + id + '">');
                for (var x = 10; x < 18; x++) {
                    $('#century1' + id).append('<option value="' + x + '">' + x + 'th century</option>');
                    $('#century2' + id).append('<option value="' + x + '">' + x + 'th century</option>');
                }
            } else if (itemType.indexOf('LAYOUT') > -1) {
                $('#criteriaInput' + id).remove();
                $('#c' + id).append('<select name="layout" id="layout' + id + '>');
                $('#layout' + id).append('<option value="score">score</option>').append('<option value="parts">parts</option>');
            } else {

                if ($('#criteriaInput' + id).length == 0) {
                    $('#layout' + id).remove();
                    $('#century2Label').remove();
                    $('#century1Label').remove();
                    $('#century1' + id).remove();
                    $('#century2' + id).remove();
                    $('#c' + id).append('<input class="autoInput" id="criteriaInput' + id + '" name="criteriaInput' + id + '" value="">');
                }
            }

        };

        $(document).ready(function () {



          var loginOverlay=  $('.utl a[rel="#overlay"]').overlay({
        mask:'#333',
        onBeforeLoad: function() {
            $('.utl a[rel="#overlay"]').live("click", function() {
                //checkOverlayStatus();
            });
            $("#overlay").removeAttr("class");
            $("#overlay").attr("class", "loginBox");
            var wrap = this.getOverlay().find('.overlayContent');
            url = this.getTrigger().attr("href");
            tgt = url + " #container";
            wrap.load(tgt, function() {
                //$('').empty();
            });

        },
        onLoad: function() {

            $('#loginForm').submit(function() {
                var over=this.getOverlay();
                $.post('j_security_check', $("#loginForm").serialize(), function(data) {
                    loginOverlay.close();
                    // document.location.reload();
                    var msg=data.replace('/[\n|\r]/g','');
                    if (msg.indexOf('not possible')>-1){
                        $('span.msg2').html(data);
                    }else{
                        document.location.reload();
                    }
                });
                return false;
            });
        },
                api:true,
        fixed:true
    });



            $('#resetForm').click(function() {
                for (var x = 1; x < 6; x++) {
                    resetCriteria(x);
                    if (x > 1) {
                        $('#c' + x).hide();
                    }
                }
            });

			$('.criteriaSelector').change( function() {
				itemType = $(this).val();
                var id=$(this).attr('id').replace('criteriaType','');

				if ( $('#ac'+id).hasClass("acenabled") ) {
					$('#ac'+id).removeClass('acenabled');
					$('#ac'+id).attr("title","");
				};
				if (( itemType=='DATE') ||( itemType=='TEXT') || (itemType=='DESCRIPTION') || (itemType=='TAGS')) {
					$('#ac'+id).removeClass('acenabled');
				} else {
					ac = $('#ac'+id);
					ac.addClass("hasAutoComplete acenabled");
					ac.attr("title", "Auto complete is available for this field")
				}
			});

            $(".autoInput").autocomplete({ appendTo: "#autocompleteDrop", html: 'html',
                source:  function(request, response) {
                    var id = $(this.element).attr('name').replace('criteriaInput', '');
                    var itemType = $('#criteriaType' + id).val();
                    var search = request.term;
                    if (itemType.indexOf('DESCRIPTION') < 0 && itemType.indexOf('TAGS') < 0  && itemType.indexOf('TEXT') < 0) {
                        $.getJSON("SearchManager", {search:search,op:2,iid:id,itemType:itemType}, response);
                    }
                },
                minLength: 2,
                select
                        :
                function(event, ui) {
                    $(this).val(ui.item.label);
                    var id = $(this).attr('name').replace('criteriaInput', '');

                }
            })
                    ;

            $('select.criteriaSelector').change(function() {
                var id = $(this).attr('id').replace('criteriaType', '');
                resetCriteria(id);
                redrawCriteria(id);
            });
            $('.hideButton').click(function() {
                var div = $(this).parent(); //s('div');
                $(div).attr('class', 'hideClass');
                var id = $(div).attr('id').replace('c', '');
                $('#value' + id).val('');
                $(div).slideUp();
            });
            $('.addButton').click(function() {
                for (var i = 2; i <=maxCriteria; i++) {
                    if ($('#c' + i).attr('class').indexOf('hideClass') > -1) {
                        $('#c' + i).hide();
                        var c = $('#c' + i).attr('class').replace('hideClass', '');
                        $('#c' + i).attr('class', c);
                        $('#c' + i).slideDown();
                        break;
                    }
                }
            });
            $('#searchManagerForm').submit(function() {
                var reject = validate();
                if (reject == 1) {
                    return false;
                }
            });
        });
