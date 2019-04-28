# Crypto-Wallet

Crypto-Wallet is the hardware for the FPGA (DE-0 Nano) device that integrates with Crypto-Wallet Web. 

Crypto-Wallet allows for:

* Creation of Masterkey
* Derivation of child keys
* Storing public/private keys
* Signing Transactions

## Getting Started
### FPGA
[DE0-Nano Development and Education Board](https://www.terasic.com.tw/cgi-bin/page/archive.pl?No=593) was the hardware device used to create Crypto-Wallet.

### USB Device
The [Cenrykay CP2102 USB to UART TTL485 232 Module Serial Converter Adapter](https://www.amazon.com/Cenrykay-CP2102-Converter-Adapter-Windows/dp/B07H4KMXDK/ref=sr_1_15?keywords=usb+to+uart&qid=1556413280&s=gateway&sr=8-15#customerReviews) was used to transfer data from PC -> Device and Device -> PC.

How to use USB:

* [Create & Install INF file for DE-0 Nano](https://medium.com/@kirkbackus/creating-and-installing-an-inf-file-with-the-inf-wizard-caec58c3f7d5)
* VENDOR ID: 0x10c4
* PRODUCT ID: 0xea60
* 1 switch ON 
* 2 switch OFF

<img src="https://github.com/jmaldon1/Crypto_wallet/blob/master/readme_images/USB_cables.jpg" alt="USB cables" width="400"/>

<img src="https://github.com/jmaldon1/Crypto_wallet/blob/master/readme_images/USB_device_cables.jpg" alt="USB device cables" width="400"/>

### Quartus

[Quartus Prime Lite Edition](http://fpgasoftware.intel.com/?edition=lite) was used to program the FPGA.



## How to run the Crypto-Wallet on FPGA

1. Open Quartus
2. Open crypto-wallet2.qpf
3. Click Tools > Programmer
4. Make sure hardware setup has USB-Blaster selected
5. Click start
6. When programming finishes, do not close the OpenCore Plus Status window
7. Click Tools > NIOS II Software Build Tools for Eclipse
8. Select a Workspace
9. Click the dropdown arrow next to the Green Arrow
10. Click nios_proj Nios II Hardware Configuration
11. Connect USB to PC

## Built With

* [DE0-Nano Development and Education Board](https://www.terasic.com.tw/cgi-bin/page/archive.pl?No=593) - FPGA Hardware Device
* [Quartus Prime Lite Edition](http://fpgasoftware.intel.com/?edition=lite) - FPGA programming software
* [Nios® II/f "Fast"](https://www.intel.com/content/www/us/en/products/programmable/processor/nios-ii.html) - Built-in soft processor for DE-0 Nano
* [Cenrykay CP2102 USB to UART TTL485 232 Module Serial Converter Adapter](https://www.amazon.com/Cenrykay-CP2102-Converter-Adapter-Windows/dp/B07H4KMXDK/ref=sr_1_15?keywords=usb+to+uart&qid=1556413280&s=gateway&sr=8-15#customerReviews) - Device communication

## Authors

* **Joshua Maldonado** - [LinkedIn](https://www.linkedin.com/in/joshua-maldonado/)

* **Brian Silver** - [LinkedIn](https://www.linkedin.com/in/brian-silver/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details