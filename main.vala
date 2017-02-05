// modules: gtk+-3.0
using Gtk;
using Ahm;

int main(string[] args) {

    init(ref args);

    // Create the header with a title
    Header header = new Header("My App", "Made with Vala");

    new MainWindow(header);

    Gtk.main();

    return 0;
}

namespace Ahm {

    public class Header: HeaderBar {
        /**
         * Header Constructor
         *
         * @param title The title to use for the header
         * @param subtitle The subtitle to use for the header
         */
        public Header(string title, string subtitle) {
            this.set_title(title);
            this.set_subtitle(subtitle);
            this.set_show_close_button(true);
        }
    }

    public class MainWindow: Window {
        private string btnLabel = "Button Label";
        private string newLabel = "Button Clicked";
        /**
         * MainWindow Constructor
         *
         * @param header The title to use for the header
         */
        public MainWindow(Gtk.HeaderBar header) {
            this.set_titlebar(header);
            this.destroy.connect(Gtk.main_quit);
            this.set_default_size(350, 70);
            this.border_width = 10;

            Button button = new Button.with_label("Hello Elementary!");
            button.clicked.connect(changeLabel);

            this.add(button);
            this.show_all();
        }

        private void changeLabel(Gtk.Button btn) {
            if (newLabel != btn.get_label()) {
                btnLabel = btn.get_label();
                btn.label = newLabel;
            } else {
                btn.label = btnLabel;
            }
        }
    }
}
