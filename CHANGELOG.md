# Changelog

## [1.0.3] - 2024-09-12
### Added
- Added description to each role in the collection for better clarity and usability.

## [1.0.2] - 2024-09-10
### Fixed
- Resolved issues related to shebang in shell scripts by replacing `#!/bin/bash` with `#!/usr/bin/env bash`.
- Fixed ShellCheck errors in `enroll_local_account.sh` and `setup_ccli.sh`:
  - Quoted variables to prevent globbing and word splitting.
  - Refactored exit code checks to check commands directly instead of using `$?`.

## [1.0.1] - 2024-09-09
### Added
- Added support for CentrifyCLI setup.
- Improved error handling for account enrollment.

## [1.0.0] - 2024-07-08
### Added
- Initial release of the Delinea PAS role.
- Added support for enrolling local accounts.

### Changed
- Refactored scripts for better error handling and portability.
