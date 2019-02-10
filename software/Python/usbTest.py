import usb.backend.libusb1

def main():
    # backend = usb.backend.libusb0.get_backend(find_library=lambda x: "C:\\Users\\Class2018\\Documents\\Projects\\Crypto_wallet\\ia64\\libusb0.dll")
    # dev = usb.core.find(backend=backend)
    dev = usb.core.find(idVender=0x10c4, idProduct=0xea60)
    if dev is None:
        raise ValueError("Device not found")



if __name__ == '__main__':
    main()