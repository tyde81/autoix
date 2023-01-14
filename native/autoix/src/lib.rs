use core::panic;
use std::cell::RefCell;

use enigo::*;

thread_local!(
    static ENIGO: RefCell<Enigo> = RefCell::new(Enigo::new())
);

#[rustler::nif]
fn mouse_move_to(x: i32, y: i32) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        enigo.mouse_move_to(x, y);
    });
}

#[rustler::nif]
fn mouse_move_relative(x: i32, y: i32) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        enigo.mouse_move_relative(x, y);
    });
}

#[rustler::nif]
fn mouse_click(button: &str) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        let key_button = match button {
            "left" => MouseButton::Left,
            "right" => MouseButton::Right,
            "middle" => MouseButton::Middle,
            "scroll_down" => MouseButton::ScrollDown,
            "scroll_up" => MouseButton::ScrollUp,
            "scroll_left" => MouseButton::ScrollLeft,
            "scroll_right" => MouseButton::ScrollRight,

            _ => panic!("Invalid key"),
        };

        enigo.mouse_click(key_button);
    });
}

#[rustler::nif]
fn mouse_down(button: &str) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        let key_button = match button {
            "left" => MouseButton::Left,
            "right" => MouseButton::Right,
            "middle" => MouseButton::Middle,
            "scroll_down" => MouseButton::ScrollDown,
            "scroll_up" => MouseButton::ScrollUp,
            "scroll_left" => MouseButton::ScrollLeft,
            "scroll_right" => MouseButton::ScrollRight,

            _ => panic!("Invalid key"),
        };

        enigo.mouse_down(key_button);
    });
}

#[rustler::nif]
fn mouse_up(button: &str) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        let key_button = match button {
            "left" => MouseButton::Left,
            "right" => MouseButton::Right,
            "middle" => MouseButton::Middle,
            "scroll_down" => MouseButton::ScrollDown,
            "scroll_up" => MouseButton::ScrollUp,
            "scroll_left" => MouseButton::ScrollLeft,
            "scroll_right" => MouseButton::ScrollRight,

            _ => panic!("Invalid key"),
        };

        enigo.mouse_up(key_button);
    });
}

#[rustler::nif]
fn key_sequence_parse(input: &str) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        enigo.key_sequence_parse(input);
    });
}

#[rustler::nif]
fn key_down(key: &str) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        let key_match = match key {
            "alt" => Key::Alt,
            "backspace" => Key::Backspace,
            "capslock" => Key::CapsLock,
            "control" => Key::Control,
            "delete" => Key::Delete,
            "down_arrow" => Key::DownArrow,
            "end" => Key::End,
            "escape" => Key::Escape,
            "f1" => Key::F1,
            "f10" => Key::F10,
            "f11" => Key::F11,
            "f12" => Key::F12,
            "f2" => Key::F2,
            "f3" => Key::F3,
            "f4" => Key::F4,
            "f5" => Key::F5,
            "f6" => Key::F6,
            "f7" => Key::F7,
            "f8" => Key::F8,
            "f9" => Key::F9,
            "home" => Key::Home,
            "left_arrow" => Key::LeftArrow,
            "option" => Key::Option,
            "page_down" => Key::PageDown,
            "page_up" => Key::PageUp,
            "return" => Key::Return,
            "right_arrow" => Key::RightArrow,
            "shift" => Key::Shift,
            "space" => Key::Space,
            "tab" => Key::Tab,
            "up_arrow" => Key::UpArrow,
            "super" => Key::Meta,

            str => {
                let chars: Vec<char> = str.chars().collect();

                let char = chars.first().unwrap();

                Key::Layout(*char)
            }
        };

        enigo.key_down(key_match);
    });
}

#[rustler::nif]
fn key_up(key: &str) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        let key_match = match key {
            "alt" => Key::Alt,
            "backspace" => Key::Backspace,
            "capslock" => Key::CapsLock,
            "control" => Key::Control,
            "delete" => Key::Delete,
            "down_arrow" => Key::DownArrow,
            "end" => Key::End,
            "escape" => Key::Escape,
            "f1" => Key::F1,
            "f10" => Key::F10,
            "f11" => Key::F11,
            "f12" => Key::F12,
            "f2" => Key::F2,
            "f3" => Key::F3,
            "f4" => Key::F4,
            "f5" => Key::F5,
            "f6" => Key::F6,
            "f7" => Key::F7,
            "f8" => Key::F8,
            "f9" => Key::F9,
            "home" => Key::Home,
            "left_arrow" => Key::LeftArrow,
            "option" => Key::Option,
            "page_down" => Key::PageDown,
            "page_up" => Key::PageUp,
            "return" => Key::Return,
            "right_arrow" => Key::RightArrow,
            "shift" => Key::Shift,
            "space" => Key::Space,
            "tab" => Key::Tab,
            "up_arrow" => Key::UpArrow,
            "super" => Key::Meta,

            str => {
                let chars: Vec<char> = str.chars().collect();

                let char = chars.first().unwrap();

                Key::Layout(*char)
            }
        };

        enigo.key_up(key_match);
    });
}

#[rustler::nif]
fn key_click(key: &str) {
    ENIGO.with(|cell| {
        let mut enigo = cell.borrow_mut();

        let key_match = match key {
            "alt" => Key::Alt,
            "backspace" => Key::Backspace,
            "capslock" => Key::CapsLock,
            "control" => Key::Control,
            "delete" => Key::Delete,
            "down_arrow" => Key::DownArrow,
            "end" => Key::End,
            "escape" => Key::Escape,
            "f1" => Key::F1,
            "f10" => Key::F10,
            "f11" => Key::F11,
            "f12" => Key::F12,
            "f2" => Key::F2,
            "f3" => Key::F3,
            "f4" => Key::F4,
            "f5" => Key::F5,
            "f6" => Key::F6,
            "f7" => Key::F7,
            "f8" => Key::F8,
            "f9" => Key::F9,
            "home" => Key::Home,
            "left_arrow" => Key::LeftArrow,
            "option" => Key::Option,
            "page_down" => Key::PageDown,
            "page_up" => Key::PageUp,
            "return" => Key::Return,
            "right_arrow" => Key::RightArrow,
            "shift" => Key::Shift,
            "space" => Key::Space,
            "tab" => Key::Tab,
            "up_arrow" => Key::UpArrow,
            "super" => Key::Meta,

            str => {
                let chars: Vec<char> = str.chars().collect();

                let char = chars.first().unwrap();

                Key::Layout(*char)
            }
        };

        enigo.key_click(key_match);
    });
}

rustler::init!(
    "Elixir.Autoix.Native",
    [
        mouse_move_to,
        mouse_click,
        mouse_move_relative,
        mouse_down,
        mouse_up,
        key_sequence_parse,
        key_down,
        key_up,
        key_click
    ]
);
