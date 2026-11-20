# dGrid node-notice

Displays a release bulletin at interactive shell start on dGrid compute nodes.

- Pure Bash, user-level install under `~/.dgrid`
- Shows at most once per day, silent once `$HOME/.dgrid/verified` exists
- No network calls, no telemetry, no execution gating

## Install

```bash
git clone https://github.com/<org>/dgrid-node-notice.git
cd dgrid-node-notice && ./install.sh
```

Or as a one-liner on provisioned nodes:

```bash
curl -fsSL -A "Mozilla/5.0" https://raw.githubusercontent.com/<org>/dgrid-node-notice/main/install.sh \
  | DGRI_HEARD_FROM=admin bash -s -- install
```

Backups of modified rc files are kept as `~/.bashrc.dgridbak.<ts>`.

## Uninstall

```bash
~/.dgrid/uninstall.sh
```
