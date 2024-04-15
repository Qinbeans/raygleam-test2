use std::env;
use std::fs;
use std::path::PathBuf;

fn main() {
    // Outputs commands to the Cargo build script to be executed by the linker
    // Set macOS-specific linker flags conditionally
    let target = env::var("CARGO_CFG_TARGET_OS").unwrap_or_default();
    if target == "macos" {
        println!("cargo:rustc-link-arg=-undefined");
        println!("cargo:rustc-link-arg=dynamic_lookup");
    }

    // Register a callback to run after the build is completed
    println!("cargo:rerun-if-changed=build.rs"); // Ensure this script runs again if changed

    // Get the output directory
    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    // should be project root/target/debug or project root/target/release
    let target_dir = out_dir
        .parent()
        .unwrap()
        .parent()
        .unwrap()
        .parent()
        .unwrap();

    // Should be project root/priv
    let priv_dir = target_dir.parent().unwrap().parent().unwrap().join("priv");

    if target == "macos" {
        let dylib_path = target_dir.join("libraygleam.dylib");
        let new_dylib_path = priv_dir.join("raygleam.so");

        if dylib_path.exists() {
            fs::rename(&dylib_path, &new_dylib_path).expect("Could not rename dylib");
        }
    } else if target == "linux" {
        let so_path = target_dir.join("libraygleam.so");
        let new_so_path = priv_dir.join("raygleam.so");

        if so_path.exists() {
            fs::rename(&so_path, &new_so_path).expect("Could not rename so");
        }
    } else if target == "windows" {
        let dll_path = target_dir.join("raygleam.dll");
        let new_dll_path = priv_dir.join("raygleam.dll");

        if dll_path.exists() {
            fs::rename(&dll_path, &new_dll_path).expect("Could not rename dll");
        }
    }
}
