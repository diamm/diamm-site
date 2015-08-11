//Cufon.replace('.c1 h3, .c1 h2, .nvg li a, .u h2, #t0 .hdp h1, #t1 .c1 h2, #t0 .c2 h3, #t4 .c2 h3, #t2 .hdp h1');
// Cufon.replace(' .nvz li', {hover:true }); 
function megaReveal() {

    var reg = /[A-z]/g;
    var megadrop = $(this).find('.megadrop');
    var megadropHTML = megadrop.html();
    var isEmpty = reg.test(megadropHTML);
    if (isEmpty == true) {
        $(this).addClass("megaVisible");
    }
    ;
}
;

function megaHide() {
    $(this).removeClass("megaVisible");
}
;


function checkOverlayStatus() {

    var overlayContent = $('.overlayContent').html();

    if (overlayContent.length) {
        $('.overlayContent').empty();
    }
    ;
}
;

function createOverlay(overlayParams) {

    var targetElement = overlayParams.targetEl;
    var trigger = overlayParams.triggerEl;
    if (!overlayParams.extraClass) {
        var extraClass = '';
    } else {
        var extraClass = overlayParams.extraClass;
    }

    if (!overlayParams.fixed) {
        var fixed = false;
    } else {
        var fixed = true;
    }

    if (!overlayParams.mask) {
        var mask = '';
    } else {
        var mask = '#333'
    }

    if (!overlayParams.removeBlock) {
        var removeBlock = '';
    } else {
        var removeBlock = overlayParams.removeBlock;
    }

    if (!overlayParams.hideViewFullRecord) {
        var hideViewFullRecord = false;
    } else {
        var hideViewFullRecord = overlayParams.hideViewFullRecord;
    }


    trigger.overlay({
        mask: mask,
        onBeforeLoad: function() {
            trigger.live("click", function() {
                checkOverlayStatus();
            });
            $("#overlay").removeAttr("class");
            $("#overlay").attr("class", extraClass);
            var wrap = this.getOverlay().find('.overlayContent');
            url = this.getTrigger().attr("href");
            tgt = url + targetElement;
            wrap.load(tgt, function() {
                $(removeBlock).empty();
            });
        },
        onLoad: function() {
            url = url.replace('&summary=1', '');
            if (hideViewFullRecord == false) {
                linkHTML = '<p><a href="' + url + '">View full record</a></p>';
            } else {
                linkHTML = '';
            }
            if ($(removeBlock).length) {
                $(removeBlock).html(linkHTML);
            } else {
                $('.overlayContent').append(linkHTML);
            }
        },
        fixed: fixed
    });


}

$(document).ready(function() {
    $('html').addClass('j');

    try {
        if ($("#twitter").length>0) {
            $("#twitter").getTwitter({
                userName: "diammpub",
                numTweets: 2,
                loaderText: "Loading tweets...",
                slideIn: false,
                //slideDuration: 750,
                showHeading: false,
                //headingText: "DIAMM on Twitter",
                showProfileLink: true,
                showTimestamp: true
            });
        }
    } catch(e) {
        // pass
    }

    // for login
    /* disable for testing
     if ($("a.t10.m4").attr('rel')!=undefined) {
     $(this).live("click", function() {
     $(this).attr("rel","overlay");
     createOverlay() });
     }

     if ($('#overlay').length<=0) {
     var overlay = $('<div id="overlay"></div>');
     $('<div class="overlayContent"></div>').appendTo(overlay);
     overlay.appendTo($('body'));
     createOverlay();
     } else {
     createOverlay();
     }
     */


    $(".showList a").click(function() {
        var url = new String(window.location);
        var href = $(this).attr("href");

        $(this).parent().toggleClass('hide');
        $(this).parent().siblings().toggle();
        if ($(this).hasClass('t9')) {
            $(this).removeClass('s77').addClass('s7');
        } else {
            if ($(this).hasClass('t9')) {
                $(this).addClass('s77').removeClass('s7');
            }
        }

        if (url.indexOf(href) > -1) {
            // source facet issues
            parentId = $(this).parent().parent().attr("id");
            if (parentId == 'sourceFacet') {
                selectedList = 'sourceFacet > ul';
                if ($(selectedList).length <= 0) {
                    return true;
                }
            }
            return false;
        }
    });

    // Add rel links
    $("#t1 #cs a").each(function() {
        try {

            if ($(this).attr("href") && $(this).attr("href").indexOf("op=") > -1 && $(this).attr("href").indexOf("op=1") < 0 && $(this).attr("href").indexOf("op=6") < 0 && $(this).attr("href").indexOf("op=SOURCE") < 0 && $(this).attr("href").indexOf("op=COMPOSER") < 0) {
                $(this).attr("rel", "#overlay");
                if ($(this).attr("href").indexOf("op=ARCHIVE") > -1) {
                    $(this).addClass("archiveTrigger");
                } else if ($(this).attr("href").indexOf("op=SOURCE") > -1) {
                    $(this).addClass("mssTrigger");
                } else if ($(this).attr("href").indexOf("op=COMPOSER") > -1) {
                    $(this).addClass("composerTrigger");
                } else if ($(this).attr("href").indexOf("op=GENRE") > -1) {
                    $(this).addClass("genreTrigger");
                }
            }
        } catch(e) {
            // pass
        }
    });


    // for archives
    var archiveParams = {
        targetEl: " #popupSummary",
        triggerEl: $('a.archiveTrigger'),
        extraClass: "archiveBox",
        mask: true,
        removeBlock: "#sources"
    };
    createOverlay(archiveParams);

    // for login
    /*var loginParams = {
     targetEl: " #container",
     triggerEl: $('.utl a[rel="#overlay"]'),
     extraClass: 'loginBox',
     hideViewFullRecord: true,
     fixed: true,
     mask: true
     };
     createOverlay(loginParams);*/


    $('.utl a[rel="#overlay"]').overlay({
        mask:'#333',
        onBeforeLoad: function() {

            $('.utl a[rel="#overlay"]').live("click", function() {
                checkOverlayStatus();
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
                $.post('j_security_check', $("#loginForm").serialize(), function(data) {
                    //$('#loginForm').data("overlay").close()
                    // document.location.reload();
                    var msg = data.replace('/[\n|\r]/g', '');
                    if (msg.indexOf('not possible') > -1) {
                        $('span.msg2').html(data);
                    } else {
                        document.location.reload();
                    }
                });
                return false;
            });
        },
        fixed:true
    });


    // for mss links (left col)
    var mssLeftParams = {
        targetEl: " #popupSummary",
        triggerEl: $("a.mssTrigger"),
        extraClass: "mssBox",
        mask: true
    };
    createOverlay(mssLeftParams);

    // for composer (right col)
    var composerParams = {
        targetEl: " #popupSummary",
        triggerEl: $("a.composerTrigger"),
        extraClass: "composerBox",
        mask: true
    }
    createOverlay(composerParams);

    // for genre (right col)
    var genreParams = {
        targetEl: " #popupSummary",
        triggerEl: $("a.genreTrigger"),
        extraClass: "genreBox",
        mask: true
    }
    createOverlay(genreParams);

    // Collections: on MS DB page
    /*var collectionsDBParams = {
     targetEl: " #container",
     triggerEl: $("a.t9.m2.overlay"),
     extraClass: "collectionsDbBox",
     mask: true,
     fixed: true,
     top: "10%",
     left: "30%",
     hideViewFullRecord: true
     };
     createOverlay(collectionsDBParams);*/


    /*$("a.t9.m2.overlay").overlay({
        mask:'#333',
        onBeforeLoad: function() {
            $("a.t9.m2.overlay").live("click", function() {
                checkOverlayStatus();
            });
            $("#overlay").removeAttr("class");
            $("#overlay").attr("class", "collectionsDbBox");
            var wrap = this.getOverlay().find('.overlayContent');
            url = this.getTrigger().attr("href");
            tgt = url + " #container";
            wrap.load(tgt, function() {
                //$('').empty();
            });

        },
        onLoad: function() {

            $('#collectionForm').submit(function() {

                $.post('CollectionLink', $("#collectionForm").serialize(), function() {
                    $('span.msg3').html('Added');
                });
                return false;
            });

            $('#newCollection').submit(function() {

                $.post('CollectionLink', $("#newCollection").serialize(), function() {
                    $('span.msg3').html('Collection created.');
                });
                return false;
            });
        },
        fixed:true
    });*/


    // help link
    var helpParams = {
        targetEl: " #container",
        triggerEl: $("a.helpIcon"),
        extraClass: "helpBox",
        mask: true,
        fixed: true,
        top:"10%",
        left:"30%",
        hideViewFullRecord: true
    };
    createOverlay(helpParams);

    /*
     for image viewer: content for overlay is inline: don't call external function
     (loads from external page)
     */


    // Annotations
    var annotationsParams = {
        mask: "#333",
        fixed: true,
        top: "20%",
        left: "40%"
    };
    $("a[rel='#add-note']").overlay(annotationsParams);


    /* 	Collections: on image viewer page. Doesn't call createOverlay
     Uses JQ Tools overlay functionality directly
     */
    var collectionsParams = {
        mask: "#333",
        fixed: true,
        top: "20%",
        left: "30%",
        onClose: function() {
            // get rid of temp msg and scroll?
        }
    };
    //createOverlay(collectionsParams);
   // $("a[rel='createCollLink']").overlay(collectionsParams);
    //$("a[rel='#add-to-existing']").overlay(collectionsParams);


    // image viewer controls
    var config = {
        over: megaReveal,
        timeout: 0,
        out: megaHide,
        sensitivity:4
    };


    /* Collections doesn't always have content
     check for empty spaces
     */


    $("li.mega").hoverIntent(config);

	/* create overflow scroll bars for image list on mss search page */
	$('#detailTabs #imageList').css('height', $(window).height()-80 );


});


