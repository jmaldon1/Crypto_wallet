from bip39_table import bip39table


strPath = "C:\\Users\\Class2018\\Documents\\Projects\\Crypto_wallet\\firmware\\altera_ip\\"
outputFileName = "bip39table"


def hexStringChecksum(hexString):
    checksum = 0
    previous = ""

    for idx, current in enumerate(hexString):
        if (idx % 2) == 0:
            previous = current
        else:
            checksum += int(previous + current, 16)
    return ((~checksum + 1) & 0xFF)


def main():
    outputFilePath = strPath + outputFileName + "_32.HEX"
    print("Opening output file: " + outputFilePath)

    hex32OutputFile = open(outputFilePath, 'w')

    listIndex = 0

    for word in bip39table:
        for i in range(0, len(word)):
            hexString = "04%04x00%s" % (listIndex, word[i])
            print(hexString)
            checksum = hexStringChecksum(hexString)
            writeString = ":" + hexString + "%02x" % (checksum, )

            hex32OutputFile.write("%s\n" % (writeString, ))
            listIndex += 1

        for j in range(len(word), 128):
            hexString = "04%04x00%s" % (listIndex, 0)
            print(hexString)
            checksum = hexStringChecksum(hexString)
            writeString = ":" + hexString + "%02x" % (checksum, )

            hex32OutputFile.write("%s\n" % (writeString, ))
            listIndex += 1

    writeString = ":00000001FF"
    hex32OutputFile.write("%s\n" % (writeString, ))

    print("Done writing file")
    hex32OutputFile.close()


if __name__ == '__main__':
    main()
