<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <dl>
            m4_include(team)
        </dl>
        <script>
            class ClockElement extends HTMLElement {
                constructor() {
                    super();
                }
            }
            function updateClocks() {
                var clocks = document.getElementsByTagName('clock-element')
                for(var i=0; i<clocks.length; i++) {
                    var clock = clocks[i];
                    var timezone = clock.attributes['timezone'].value;
                    var time = new Intl.DateTimeFormat(undefined, {timeZone: timezone, hour: "2-digit", minute: "2-digit", second: "2-digit"}).format(new Date());
                    clock.innerHTML = time + ' (' + timezone + ')';
                }
            }
            customElements.define('clock-element', ClockElement);
            window.setInterval(updateClocks, 1000);
        </script>
    </body>
</html>
