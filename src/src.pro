TEMPLATE = app

TARGET = MetaGate

DEFINES += VERSION_STRING=\\\"1.14.1\\\"
#DEFINES += DEVELOPMENT
DEFINES += PRODUCTION
DEFINES += APPLICATION_NAME=\\\"MetaGate\\\"

DEFINES += GIT_CURRENT_SHA1="\\\"$$system(git rev-parse --short HEAD)\\\""

SOURCES += main.cpp mainwindow.cpp \
    Wallet.cpp \
    client.cpp \
    machine_uid_win.cpp \
    unzip.cpp \
    uploader.cpp \
    EthWallet.cpp \
    ethtx/scrypt/crypto_scrypt-nosse.cpp \
    ethtx/scrypt/sha256.cpp \
    ethtx/cert.cpp \
    ethtx/rlp.cpp \
    ethtx/ethtx.cpp \
    ethtx/cert2.cpp \
    ethtx/scrypt/crypto_scrypt_saltgen.cpp \
    ethtx/crossguid/Guid.cpp \
    btctx/Base58.cpp \
    btctx/btctx.cpp \
    btctx/wif.cpp \
    BtcWallet.cpp \
    VersionWrapper.cpp \
    StopApplication.cpp \
    tests.cpp \
    Log.cpp \
    openssl_wrapper/openssl_wrapper.cpp \
    utils.cpp \
    ethtx/utils2.cpp \
    tests2.cpp \
    NsLookup.cpp \
    dns/datatransformer.cpp \
    dns/dnspacket.cpp \
    dns/resourcerecord.cpp \
    WebSocketClient.cpp \
    JavascriptWrapper.cpp \
    PagesMappings.cpp \
    mhurlschemehandler.cpp

unix: SOURCES += machine_uid_unix.cpp

HEADERS += mainwindow.h \
    Wallet.h \
    check.h \
    machine_uid.h \
    client.h \
    WindowEvents.h \
    unzip.h \
    uploader.h \
    EthWallet.h \
    ethtx/scrypt/libscrypt.h \
    ethtx/scrypt/sha256.h \
    ethtx/scrypt/sysendian.h \
    ethtx/cert.h \
    ethtx/const.h \
    ethtx/rlp.h \
    ethtx/ethtx.h \
    ethtx/crossguid/Guid.hpp \
    btctx/Base58.h \
    btctx/btctx.h \
    btctx/wif.h \
    btctx/Base58.h \
    btctx/btctx.h \
    btctx/wif.h \
    platform.h \
    VersionWrapper.h \
    BtcWallet.h \
    StopApplication.h \
    tests.h \
    Log.h \
    TypedException.h \
    openssl_wrapper/openssl_wrapper.h \
    utils.h \
    ethtx/utils2.h \
    tests2.h \
    NsLookup.h \
    dns/datatransformer.h \
    dns/dnspacket.h \
    dns/resourcerecord.h \
    WebSocketClient.h \
    JavascriptWrapper.h \
    algorithms.h \
    PagesMappings.h \
    SlotWrapper.h \
    mhurlschemehandler.h

FORMS += mainwindow.ui

QT += webengine webenginewidgets network websockets

CONFIG += static
CONFIG += c++14

DEFINES += CRYPTOPP_IMPORTS
DEFINES += QUAZIP_STATIC

#QMAKE_CXXFLAGS += -fsanitize=address
#QMAKE_LFLAGS += -fsanitize=address
QMAKE_LFLAGS += -rdynamic
#QMAKE_CXXFLAGS += -Wall -Werror

#QMAKE_CXXFLAGS += -H


#unix:!macx: LIBS += -L$$PWD/openssl_linux/lib -lssl -lcrypto
#unix:!macx: LIBS += -L$$PWD/cryptopp/lib/linux/ -lcryptopp -L$$PWD/quazip-0.7.3/libs/linux/ -lquazip -lz
#unix:!macx: LIBS += -L$$PWD/secp256k1/lib/linux/ -lsecp256k1 -lgmp -luuid
#win32: LIBS += -L$$PWD/secp256k1/lib/windows/ -ladvapi32 -lOle32 -llibsecp256k1
#win32: LIBS += -L$$PWD/cryptopp/lib/windows/ -lcryptopp -lcryptlib -L$$PWD/quazip-0.7.3/libs/win/ -lquazip
#win32: LIBS += -L$$PWD/openssl-1.0.2o-x64/lib/ -llibeay32 -lssleay32 -lws2_32 -lshell32 -ladvapi32 -lgdi32 -lUser32 -lIphlpapi
#message($$LIBS)

#win32: DEFINES += TARGET_WINDOWS

#macx: QMAKE_LFLAGS += -Wl,-rpath,@loader_path/../,-rpath,@executable_path/../,-rpath,@executable_path/../Frameworks

#macx: DEFINES += TARGET_OS_MAC

#macx: INCLUDEPATH += /usr/local/opt/openssl/include
#macx: LIBS += -L$$PWD/cryptopp/lib/mac/ -lcryptopp -L$$PWD/quazip-0.7.3/libs/mac/ -lquazip -lz
#macx: LIBS += -L$$PWD/secp256k1/lib/macx/ -lsecp256k1
#macx: PRE_TARGETDEPS += $$PWD/cryptopp/lib/mac/libcryptopp.a $$PWD/quazip-0.7.3/libs/mac/libquazip.a
#macx: LIBS += /usr/local/opt/openssl/lib/libssl.a /usr/local/opt/openssl/lib/libcrypto.a

win32: RC_ICONS = WalletMetahash.ico
macx: ICON = $${PWD}/WalletMetahash.icns

unix:!macx: include(../libs-unix.pri)
win32: include(../libs-win.pri)
macx: include(../libs-macos.pri)



DISTFILES +=

RESOURCES += \
    ../svg1.qrc
