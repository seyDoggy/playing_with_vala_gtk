using Gtk;
using Ahm;

int main(string[] args) {
    Gtk.init(ref args);

    var header = new Header();

    var btn = new Button.with_label("Hello Elementary!");
    
    new MainWindow(header, btn);
    
    Gtk.main();
    return 0;
}

namespace Ahm {
    class Header: HeaderBar {
        public Header() {
            this.set_show_close_button(true);
        }
    }

    class MainWindow: Window {
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
