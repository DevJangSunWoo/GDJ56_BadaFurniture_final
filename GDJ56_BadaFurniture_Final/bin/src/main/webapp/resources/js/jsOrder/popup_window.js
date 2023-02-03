var PopupWindow = function(name, config) {
    config = config || {};

    var popup = null;
    var timer = null;
    var isSilentMode = false;

    const url = config.url || 'about:blank';
    const onAfterOpened = function() {
        if (typeof config.onAfterOpened === 'function') {
            config.onAfterOpened();
        }

        console.log('PopupWindowOpened', name);
    };
    const onAfterClosed = function() {
        if (isSilentMode === false) {
            if (typeof config.onAfterClosed === 'function') {
                config.onAfterClosed();
            }
            console.log('PopupWindowClosed', name);
        } else {
            isSilentMode = false;
            console.log('PopupWindowClosedSilently', name);
        }
    };
    const POPUP_CLOSED_DETECTING_INTERVAL = 500; // ms
    const features = {
        width: 375, // px
        height: 667, // px
        toolbar: false, // no
        menubar: false, // no
        scrollbars: true, // yes
        resizable: false, // no
        location: false, // no
        directories: false, // no
        status: false, // no
    };

    const setFeature = function(key, value) {
        features[key] = value;
    };

    const makeFeaturesString = function() {
        const strings = [];

        $.each(features, function(key, value) {
            strings[strings.length] = key + '=' + value;
        });

        return strings.join(',');
    };

    const isOpened = function() {
        return popup !== null && timer !== null;
    };

    const getName = function() {
        return name;
    };

    const focus = function() {
        if (isOpened()) {
            popup.focus();
            return true;
        }

        return false;
    };

    const openWithForm = function(form, prepare) {
        if (!isOpened() && prepare(form) && open()) {
            form.target = name;
            form.submit();
            form.target = '_self';

            return true;
        }

        if (popup !== null) {
            popup.focus();
        }

        return false;
    };

    const open = function() {
        if (isOpened()) {
            popup.focus();
            return false;
        }

        const featuresString = makeFeaturesString();
        popup = window.open(url, name, featuresString);
        if (popup === null) {
            return false;
        }

        timer = setInterval(function() {
            if (!popup.closed) {
                return;
            }

            clearInterval(timer);
            timer = null;
            popup = null;

            onAfterClosed();
        }, POPUP_CLOSED_DETECTING_INTERVAL);

        popup.focus();
        onAfterOpened();

        return true;
    };

    const close = function() {
        if (isOpened()) {
            popup.window.close();
        }
    };

    const closeSilently = function() {
        isSilentMode = true;
        close();
    };

    return {
        open: open,
        openWithForm: openWithForm,
        close: close,
        closeSilently: closeSilently,
        isOpened: isOpened,
        focus: focus,
        getName: getName,
        setFeature: setFeature
    };
};
