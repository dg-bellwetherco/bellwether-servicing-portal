# Bellwether Servicing Portal

A standalone desktop application for managing and analyzing loan portfolios, built with Electron. Features comprehensive servicing metrics, interest calculations, cash management, and reserve tracking.

## Features

- **Portfolio Summary** — View all 36 loans with UPB, rates, and maturity analysis
- **Servicing Snapshot** — Monitor cash management, DACA accounts, and reserve balances
- **Maturity Watch** — Track upcoming loan maturities and extension needs
- **Billing Statement** — Generate detailed borrower billing with past due, escrow, and reserves
- **Interest Calculator** — Compute interest with support for SOFR, Prime, and fixed rates with junior participation
- **Escrow Management** — Track tax, insurance, and other monthly reserves by loan
- **Benchmark Rates** — Manage SOFR and Prime rates with historical rate storage
- **Data Manager** — Export/import portfolio JSON, manage manual transactions
- **Dark/Light Theme** — Toggle between dark and light interface modes

## Quick Start

### For Users

1. Download the latest release from [GitHub Releases](https://github.com/[your-username]/bellwether-portal/releases)
2. Run the `.exe` installer or extract the ZIP and run `electron.exe .`
3. The portal loads with 36 sample loans from the RMWC asset database

### For Developers

1. Clone this repository:
   ```bash
   git clone https://github.com/[your-username]/bellwether-portal.git
   cd bellwether-portal
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Run the development app:
   ```bash
   npm start
   ```

4. Build a release:
   ```bash
   npm run build
   ```

## Requirements

- **Windows 10+** (64-bit)
- Node.js 20.11.1+ (for development)
- ~150 MB disk space

## Project Structure

```
bellwether-portal/
├── main.js                          # Electron main process
├── rmwc_portfolio_portal (11).html   # Portal UI and logic
├── package.json                     # Project metadata & dependencies
├── .github/                         # GitHub configuration
│   └── copilot-instructions.md      # Project guidelines
└── README.md                        # This file
```

## Data

The portal includes a pre-loaded dataset with:
- **36 active loans** ranging from $1M to $62M UPB
- **Three loan types**: Senior, Mezzanine, Preferred
- **Multiple benchmarks**: SOFR, Prime, Fixed rates
- **Complete servicing data**: Cash management, reserves, fees, escrows

## Features In Detail

### Portfolio Analysis
- KPI cards showing total investments, UPB, senior/mezz breakdown, maturity watch count
- Interactive bar chart of all-in rates by loan type and benchmark
- Filterable table with search across loan number, property, type, and benchmark

### Billing Statement
- Date-range selection
- Full loan terms and rate derivation
- Past due analysis
- Interest calculation detail (Actual/360)
- Reserve and holdback summary
- Cash management status

### Interest Calculator
- Support for SOFR/Prime/Fixed rate types
- SOFR rounding rules (up to 0.001, 0.01, or no rounding)
- Junior participation tranche analysis (e.g., RM 1063)
- Rate determination date calculation
- Accrual day count and step-by-step formula display

### Rate Management
- Live rate fetching via Claude API (requires API key)
- Historical rate storage by date
- Manual rate entry
- Auto-recalculation across portfolio

## Build & Distribution

### Creating an Installer

```bash
npm run build
```

This generates an `.exe` installer that users can install like any Windows application.

### Creating a Portable ZIP

```bash
npm run package
```

Generates a ZIP with the standalone app ready to extract and run.

## Settings & Persistence

All settings persist to browser localStorage:
- Theme preference (dark/light)
- Manual transactions
- Historical benchmark rates
- Sidebar navigation state

## Customization

Edit `rmwc_portfolio_portal (11).html` to:
- Modify the investment dataset (INVESTMENTS array)
- Change colors and CSS variables
- Add new pages or views
- Adjust calculation logic

## License

Proprietary - Bellwether Asset Management, Inc.

## Support

For issues, feature requests, or questions:
- Open an issue on GitHub
- Contact: [support email]

---

**Version 2.0** | Data: March 2026
