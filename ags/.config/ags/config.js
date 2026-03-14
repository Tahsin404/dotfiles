import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';

const TopNotch = () => Widget.Window({
    name: 'top-notch',
    anchor: ['top'],
    exclusivity: 'normal',
    child: Widget.Box({
        className: 'notch-box',
        child: Widget.Label({
            label: 'This is the start of the Notch', 
            className: 'notch-text'
        }) 
    }),
});

// Booting up the application
export default {
    style: App.configDir + '/style.css',
    windows: [
        TopNotch(),
    ],
};
