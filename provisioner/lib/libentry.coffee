class _EntryLib

    getSummaries: (entries) ->
        entries.map (e) ->
            text = $('<div>').html( e.text ).text()
            text = (text.substring(0,200) + '...') if text.length > 204
            {text: text, title: e.title}

    redactorButtons: [ 'html', '|', 'formatting', '|', 'bold', 'italic', 'deleted', '|',
                       'unorderedlist', 'orderedlist', 'outdent', 'indent', '|',
                       'image', 'table', 'link', '|',
                       'fontcolor', 'backcolor', '|', 'alignment', '|', 'horizontalrule' ]

    filepickerKey: 'AjmU2eDdtRDyMpagSeV7rz'

    initRedactor: ($el, plugins) ->
        $el.redactor
            plugins: plugins
            imageUpload: '/images'
            # linebreaks: true # buggy - insert link on last line, hit enter to break,
            # with cursor on newline try to insert link (modal only show edit of previous link)
            buttons: this.redactorButtons,
            focus: true
            autoresize: true
            minHeight: 100 #pixels
            filepicker: (callback) =>
                filepicker.setKey(@filepickerKey)
                filepicker.pick({mimetype:"image/*"}, (file) ->
                    filepicker.store(file, {location:"S3", path: Meteor.userId() + "/" + file.filename },
                    (file) -> callback( filelink: file.url )))


@EntryLib = new _EntryLib()
