# CoinFlip PowerShell Module

A PowerShell module that simulates coin flips and calculates statistics.

## Installation

### From PowerShell Gallery (Recommended)

```powershell
Install-Module -Name CoinFlip -Scope CurrentUser
```

### Manual Installation

1. Download or clone this repository
2. Copy the module files to one of your PowerShell module directories:
   - `$env:PSModulePath.Split(':')[0]` (current user on macOS/Linux)
   - `$env:PSModulePath.Split(';')[0]` (current user on Windows)

## Usage

```powershell
# Import the module
Import-Module CoinFlip

# Flip a coin 10 times
Get-CoinFlip -FlipCount 10

# Flip a coin 1000 times
Get-CoinFlip -FlipCount 1000
```

## Output Example

```text
Heads count: 503 (50.3%)
Tails count: 497 (49.7%)
Heads wins, majority of 6 (0.6%)!
A coin was flipped 1000 times in 0.0361 seconds
```

## Features

- Simulates coin flips with random number generation
- Calculates percentage of heads and tails
- Reports which side won with the majority percentage
- Measures how long the simulation takes

## Requirements

- PowerShell 5.1 or later

## Development

### Automated Testing and Deployment

This module uses GitHub Actions for automated testing across multiple platforms and deployment to the PowerShell Gallery.

#### Testing Process

The testing workflow is triggered on:

- Push to main/master branches
- Pull requests to main/master branches
- Manual workflow dispatch

The tests run on Windows, macOS, and Linux simultaneously and include:

1. **Basic Tests** (default):
   - Module import verification
   - Function existence check
   - Function execution with various flip counts (10, 100, 1000)

2. **Full Tests** (can be selected when manually running the workflow):
   - All basic tests
   - Statistical distribution testing with 10,000 flips
   - Verification that the distribution is roughly even (within 5% of 50/50)

#### Deployment to PowerShell Gallery

After successful tests, the module is automatically published to the PowerShell Gallery:

- Deployment only occurs on the main/master branch (not on pull requests)
- The module version from the manifest file is used
- A PowerShell Gallery API key must be set in GitHub Secrets as `PSGALLERYKEY`

To run tests manually:

1. Go to the Actions tab in the repository
2. Select the "Test and Publish PowerShell Module" workflow
3. Click "Run workflow"
4. Choose the testing level (basic or full)
