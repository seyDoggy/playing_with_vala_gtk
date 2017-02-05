// modules: gtk+-3.0
using Gtk;
using Ahm;

int main(string[] args) {

    init(ref args);

    // Create the header with a title
    Header header = new Header("My App", "Made with Vala");

    Button button = new Button.with_label("Hello Elementary!");
    
    new MainWindow(header, button);
    
    Gtk.main();

    return 0;
}

namespace Ahm {

    public class Header: HeaderBar {
        /**
         * Header Constructor
         *
         * @param title string The title to use for the header
         * @param subtitle string The subtitle to use for the header
         */
        public Header(string title, string subtitle) {
            this.set_title(title);
            this.set_subtitle(subtitle);
            this.set_show_close_button(true);
        }
    }

    public class MainWindow: Window {
        /**
         * MainWindow Constructor
         *
         * @param header string The title to use for the header
         * @param btn string The subtitle to use for the header
         */
        public MainWindow(Gtk.HeaderBar header, Gtk.Button btn) {
            this.set_titlebar(header);
            this.destroy.connect(Gtk.main_quit);
            this.set_default_size(350, 70);
            this.border_width = 10;

            this.add(btn);
            this.show_all();
        }
    }
}
