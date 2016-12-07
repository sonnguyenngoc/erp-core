// Get current addablelist
function getCurrentAddablelist() {
    addablelist = $('[rel="' + $('.addablelist-modal.in').last().attr('addablelist') + '"]');

    return addablelist;
}

// Submit form event
function submitAddablelistModalForm(form) {
    var addablelist = getCurrentAddablelist();
    var method = form.attr('method');
    var url = form.attr('action');
    var modal = $('#addablelist-modal-' + addablelist.attr('rel'));
    var container_selector = addablelist.attr('container-selector');
    var container = addablelist.find('.addablelist-container');
    var list_partial = addablelist.attr('list-partial');
    
    modal.find('.modal-body').html('<div class="text-center"><i class="fa fa-circle-o-notch fa-spin"></i></div>');
    
    // form data
    var form_data = form.serializeArray();
    form_data.push({name: 'format', value: 'partial'});
    form_data.push({name: 'partial', value: list_partial});
    
    $.ajax({
        type: method,
        url: url,
        data: form_data, // serializes the form's elements.
        success: function(data)
        {
            // get data
            result = $('<div>').html(data).find(container_selector);
            if (result.length) {
                modal.find('.modal-body').html(result[0].outerHTML);
            } else {
                container.append(data);
                jsForAjaxContent(container);
                
                modal.modal('hide');                
                scrollToElement(addablelist, 140);
            }
        }
    });
}

// show create modal
function showAddablelistAddModal(addablelist) {
    var modal_size = addablelist.attr('modal-size');
    var create_title = addablelist.attr('create-title');
    var create_url = addablelist.attr('create-url');
    var container_selector = addablelist.attr('container-selector');
    
    // modal width
    if (typeof(modal_size) === 'undefined' || modal_size === '') {
        modal_size = 'md';
    }
    
    // create uid for addablelist if not exist
    var uid = addablelist.attr('rel');
    if (typeof(uid) === 'undefined' || uid === '') {
        uid = guid();
        addablelist.attr('rel', uid);
    }

    // create new modal if not exist
    var modal_uid = "addablelist-modal-" + uid;
    var html = '<div id="' + modal_uid + '" addablelist="'+uid+'" class="modal addablelist-modal fade" tabindex="-1">' +
        '<div class="modal-dialog modal-' + modal_size + '">' +
            '<div class="modal-content">' +
                '<div class="modal-header">' +
                    '<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>' +
                    '<h4 class="modal-title">' + create_title + '</h4>' +
                '</div>' +
                '<div class="modal-body">' +
                '</div>' +
            '</div>' +
        '</div>' +
    '</div>';
    $('body').append(html);
    var modal = $('#' + modal_uid);
    
    // show modal
    modal.addClass('in');
    modal.modal('show');
    modal.find('.modal-body').html('<div class="text-center"><i class="fa fa-circle-o-notch fa-spin"></i></div>');
    
    $.ajax({
        url: create_url,
    }).done(function( data ) {
        // get form
        html = $('<div>').html(data).find(container_selector)[0].outerHTML;
        modal.find('.modal-body').html(html);
        jsForAjaxContent(modal);
    });
}

$(document).ready(function() {
    // Add button
    $(document).on('keyup focus', '.addablelist-add-button', function() {
        var addablelist = $(this).parents('.addablelist');
        
        showAddablelistAddModal(addablelist);
    });
    
    // modal form submit
    $(document).on('submit', '.addablelist-modal form', function(e) {
        e.preventDefault();
        
        // submit form
        submitAddablelistModalForm($(this));
    });
});