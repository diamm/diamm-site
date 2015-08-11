/**
 * Created by IntelliJ IDEA.
 * User: Elliot  Hall
 * Date: 20/03/12
 * Time: 12:25
 *
 * Externalised js for imageViewer.jsp, with code for menus, iip omni window management
 * Dependencies:
 *<script type="text/javascript" src="../_a/s/jquery.tmpl.js"></script>
 <script type="text/javascript" src="../_a/s/jquery.omniviewer-wdgt.js"></script>
 <script type="text/javascript" src="../_a/s/jquery.mousewheel.js"></script>
 <script type="text/javascript" src="../_a/s/jq.truncator.min.js"></script>
 */





var hideControls = function() {
    $("#closeComparison").hide();
    $("#mirror").hide();
    $("#swap").hide();
    $("#ow_2").hide().html('');
};

var showControls = function() {
    $("#closeComparison").show();
    $("#mirror").show();
    $("#swap").show();
};


//Instantiates an Omniviewer instance in element selector with dimensions height and width
//Returns created omni as object
initOmni = function(selector, width, height, images) {
    var omni = $(selector).OmniViewer({
        image: images
        ,server: server
        ,credit: credit
        ,zoom: 1
        ,render: "random"
        ,showNavButtons: true
        ,showNavigation: true
        ,debug : false
        ,fileFormat: "iip"
        ,mode : "embedded"
    });
    $(selector).css("width", width + "px").css("height", height + "px");
    return omni;
};


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

$(document).ready(function() {
    var docWidth = parseInt($('body').width());
    var docHeight = parseInt($(window).height());
    var fullWidth = docWidth - Math.round(docWidth * .20);
    var fullHeight = docHeight - Math.round(docHeight * .20);

    var compareWidth = Math.round(fullWidth / 2);
    var compareHeight = fullHeight;

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

    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        theme_advanced_buttons1: 'bold,italic,underline,sub,sup,|,undo,redo' ,
        theme_advanced_buttons2 : "",
        theme_advanced_buttons3 : ""

    });

    var targetElement = " #note";
    var trigger = $("span.edit a.t10.m2");
    var fixed = true;

    var hideViewFullRecord = true;


    $("a.collectionOverlay").overlay({
        mask:'#333',
        onBeforeLoad: function() {

            $('div.overlayContent').empty();
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
    });

    $("a.deleteNote").click(function() {
        var url = $(this).attr('href');
        $(this).parents("li").hide();
        $.post(url);
        return false;
    });

    $("a[rel='#add-note']").overlay();
    $("a[rel='#update-note']").overlay({
        mask:'#333',
        onBeforeLoad: function() {
            var sel = this.getTrigger().attr("href");
            var key = sel.replace('note_', '');
            var text = $('#' + sel).html();
            if (text) {
                tinyMCE.execCommand('mceInsertContent', false, text);
            }
            if (this.getTrigger().attr("class").indexOf('private') > -1) {
                $('#updateNotePrivate').click();
            }
            else if (this.getTrigger().attr("class").indexOf('Trans') > -1) {
                $('#updateNoteType').val('TRA');
            }
            $('#updateNoteKey').val(key);

        },
        onLoad: function() {

        },
        fixed:true
    });

    var ow3 = '';
    var overlayWidth = docWidth - Math.round(docWidth * .05);
    var overlayHeight = docHeight - Math.round(docHeight * .05);
    $('#testOverlay').css("width", overlayWidth + "px").css("height", overlayHeight + "px").css("display", 'none');

    $('#manuscript').overlay({mask:'#333',top:'center'});
    $('#thumbOverlay').css("width", overlayWidth + "px").css("height", overlayHeight + "px").css("display", 'none');
    $("#tO").overlay({mask:'#333',top:'center',
        onBeforeLoad: function() {
            ow3 = initOmni("#ow_3", overlayWidth, overlayHeight, firstImage);
        }
    });
    $('a.changeFullscreen').click(function() {
        var fName = $(this).attr('rel');
        $("#ow_3").OmniViewer("destroy");
        ow3 = initOmni("#ow_3", fullWidth, fullHeight, firstImage);
        return false;
    });


    $("#closeComparison").click(function() {
        //Remove second window
        //todo:  change first resolution?
        $("#ow_2").OmniViewer("destroy");
        ow2 = null;
        $("#ow_1").OmniViewer("destroy");
        ow1 = initOmni("#ow_1", compareWidth, compareHeight, firstImage);
        //firstImage=images;
        $(ow1).css("float", "left").css("margin", "10px");
        hideControls();
    });
    hideControls();
    $('li a.openRISM').click(function() {
        if (ow2) {
            $("#ow_2").OmniViewer("destroy");
        }
        var src = $(this).attr('href');
        ow1 = initOmni("#ow_1", compareWidth, compareHeight, firstImage);
        //firstImage=images;
        $(ow1).css("float", "left").css("margin", "10px");
        $("#ow_2").html('<img style="width:100%" src="' + src + '"/>');
        secondImage=[src];
        $("#ow_2").css("width", compareWidth + "px").css("float", "left").css("margin", "10px").show();
        showControls();
        return false;
    });
    $('li a.openAlt').click(function() {
        var fName = $(this).attr('rel');
        if (fName) {
            if (ow2) {
                $("#ow_2").OmniViewer("destroy");
            }
            var rgny = $('#ow_1').OmniViewer("getRgny");
            var rgnx = $('#ow_1').OmniViewer("getRgnx");
            var zoom = $('#ow_1').OmniViewer("getZoomLevel");
            $("#ow_1").OmniViewer("destroy");
            ow1 = initOmni("#ow_1", compareWidth, compareHeight, firstImage);
            //firstImage=firstImage;
            $(ow1).css("float", "left").css("margin", "10px");
            ow2 = initOmni("#ow_2", compareWidth, compareHeight, [fName + '.jp2']);
            secondImage=[fName + '.jp2'];
            $(ow2).css("float", "left").css("margin", "10px").show();

        }
        showControls();
        return false;
    });

    var ow1 = initOmni("#ow_1", fullWidth, fullHeight, firstImage);
    $(ow1).css("float", "left").css("margin", "10px");


    $('#swap').bind("click", function() {
        //Destroy both windows.
        $("#ow_1").OmniViewer("destroy");
        if (ow2){
            $("#ow_2").OmniViewer("destroy");
        }  else{
            $('#RISMImage').remove();
        }
        //Swap urls
        var swapImage=firstImage;
        firstImage=secondImage;
        secondImage=swapImage;
        //images=firstImage;
        //reinstantiate

        if (firstImage[0].indexOf('.jp2')>-1){
            ow1 = initOmni("#ow_1", compareWidth, compareHeight, firstImage);
            $(ow1).css("float", "left").css("margin", "10px");
        }else{
            //RISM
            $("#ow_1").html('<img id="RISMImage" style="width:100%" src="' + firstImage[0] + '"/>');
        }

        if (secondImage[0].indexOf('.jp2')>-1){
            ow2 = initOmni("#ow_2", compareWidth, compareHeight, secondImage);
            $(ow2).css("float", "left").css("margin", "10px");
        }else{
            //RISM
            $("#ow_2").html('<img id="RISMImage" style="width:100%" src="' + secondImage[0] + '"/>');
        }
        alert(firstImage+'::'+secondImage);
            /*ow2 = initOmni("#ow_2", compareWidth, compareHeight, [fName + '.jp2']);
            $(ow2).css("float", "left").css("margin", "10px").show();*/
    });

    $('#mirror').bind("click", function() {
        var status = $(this).data('mirror');
        // do stuff

        if (typeof status == 'undefined') {
            $(this).text('Unsynch');
            status = true;
            $("#ow_2").OmniViewer({
                zoomIn:function(event, data) {
                    ow1.OmniViewer("zoomIn");
                }
                ,zoomOut:function(event, data) {
                    ow1.OmniViewer("zoomOut");
                }
                ,scrollTo:function(event, data) {
                    ow1.OmniViewer("scrollTo", data.dx, data.dy);
                }
            });
        }
        else if (status) {
            status = false;
            $(this).text('Synch');
            $("#ow_2").OmniViewer({
                zoomIn:null
                ,zoomOut:null
                ,scrollTo:null
            });
        }
        else if (!status) {
            status = true;
            $(this).text('Unsynch');
            $("#ow_2").OmniViewer({
                zoomIn:function(event, data) {
                    ow1.OmniViewer("zoomIn");
                }
                ,zoomOut:function(event, data) {
                    ow1.OmniViewer("zoomOut");
                }
                ,scrollTo:function(event, data) {
                    ow1.OmniViewer("scrollTo", data.dx, data.dy);
                }
            });
        }
        $(this).data('mirror', status);
    })


});