yourproject = window.yourproject ?= {}

yourproject.util =
  # Workaround for MobileSafari zoom bug after orientation change.
  # From: http://adactio.com/journal/4470/
  iosZoomWorkaround: ->
    ua = navigator.userAgent
    if ua.match(/iPhone/) or ua.match(/iPad/)
      viewportmeta = $('meta[name="viewport"]')

      if viewportmeta.length > 0
        viewportmeta.attr "content", "width=device-width, minimum-scale=1.0, maximum-scale=1.0"
        $("body").bind "gesturestart", ->
          viewportmeta.attr "content",
                            "width=device-width, minimum-scale=0.25, maximum-scale=1.6"
          return
        return

$ ->
  yourproject.util.iosZoomWorkaround()
  return
