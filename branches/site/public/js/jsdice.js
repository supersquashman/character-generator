/**
 * Copyright 2009 jsdice.com. All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER 
 * IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY 
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    
 */

// Set up the jsdice namespace
if (typeof jsdice == "undefined") {
  var jsdice = {};  
}

jQuery.extend(jsdice, {
  roll : function(dice) {
        var dice = dice.replace(/- */,'+ -');
        var dice = dice.replace(/D/,'d');
        var re = / *\+ */;
        var items = dice.split(re);
        var res = new Array();
        var type = new Array();
        for ( var i=0; i<items.length; i++) {
            var match = items[i].match(/^[ \t]*(-)?(\d+)?(?:(d)(\d+))?[ \t]*$/);
            if (match) {
                var sign = match[1]?-1:1;
                var num = parseInt(match[2] || "1");
                var max = parseInt(match[4] || "0");
                if (match[3]) {
                    for ( j=1; j<=num; j++) {
                        res[res.length] = sign * Math.ceil(max*Math.random());
                        type[type.length] = max;
                    }
                }
                else {
                    res[res.length] = sign * num;
                    type[type.length] = 0;
                }
            } 
            else return null;
        }
        if (res.length == 0) return null;
        return {"res":res, "type":type};
    },
    
    resultStr : function (data){
        var total = 0;
        var str = "";
        for (var i=0; i<data.res.length; i++) {
            total = total + data.res[i];
            if (data.res.length>1) {
                if (i) str = str + ((data.res[i])>=0?"+":"-");
                str = str + Math.abs(data.res[i]);
                if (data.type[i]) str = str + "<sub>[d"+data.type[i]+"]</sub>";
            }
        }
        str = "<strong>" + total + "</strong>" + (str?"&nbsp;=&nbsp;" + str:'');
        return str;
    },

    rollDice : function(dice) {
        if ((!dice) || (dice == '')) return;
        
        var data = jsdice.roll(dice);

        if (data) {
            var str = jsdice.resultStr(data);
            jQuery('#results').append('<div class="roll_source"><small><strong>Roll:</strong></small> <a href="javascript:jsdice.doRoll(\''+dice+'\');"><span>'+dice+'</span></a></div>');
            jQuery('#results').append('<div class="roll_result">' + str + '</div>');
        }
        else {
            jQuery('#results').append('<div class="roll_source"><small><strong>Roll:</strong></small><span>'+dice+'</span><small>[<strong><em>Error in the roll formula</em></strong>]</small></div>');
        }
    },
    
    go : function() {
        var roll = jQuery('#inp_text').val();
        jsdice.rollDice(roll);
        jQuery('#inp_text').focus();
        $('#results').animate({ scrollTop: $('#results')[0].scrollHeight});
    },
    
    doRoll : function(dice) {
        jQuery('#inp_text').val(dice);
        jsdice.go();
    },
    
    doClear : function() {
        jQuery('#results').html('');
        jQuery('#inp_text').val('');
        jsdice.go();
    },
    
    // Catches the Enter key and rolls the dice
    inp_keydown : function(ev) {
      if(ev.keyCode == 13) {
        jsdice.go();
        return false;
      }
      else {
        return true;
      }
    }
});

/* JQuery Event handling */

// Add controls for showing/hiding the jsdice div
jQuery(document).ready(function(){
  jQuery("#jsdice-close").bind('click', function(e) {
    jQuery("#jsdice").css('display', 'none');
    return false;
  })
  
  jQuery("#jsdice-show").bind('click', function(e) {
    jQuery("#jsdice").css('display', 'block');
    return false;
  })
});