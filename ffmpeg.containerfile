FROM fedora:40

RUN dnf makecache && dnf update -y
RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-40.noarch.rpm
RUN dnf install -y ffmpeg

ENV RPM_FUSION_40_FINGERPRINT="E9A4 91A3 DE24 7814 E7E0 67EA E06F 8ECD D651 FF2E"

RUN ACTUAL_FINGERPRINT=$(gpg --show-keys /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-40 | sed -n '2p' | sed 's/ //g') && \
    EXPECTED_FINGERPRINT=$(echo $RPM_FUSION_40_FINGERPRINT | sed 's/ //g') && \
    if [ "$ACTUAL_FINGERPRINT" != "$EXPECTED_FINGERPRINT" ]; then echo "FINGERPRINT MISMATCH" && exit 1; fi

WORKDIR /app
