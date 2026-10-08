# p2-19-sample-app — RED
Migration: **Rails 7.0.4 → 8.0.2**.
Why meaningful: Rails 7 to 8 crosses removed ActiveRecord/ActiveSupport APIs, Rack 3 and Ruby >=3.2; full social-app authentication, activation, password reset, feed, relationships and micropost suite retained.
Source: https://github.com/learnenough/rails_tutorial_sample_app_7th_ed @ 5f91577cd1b2221fd1fdb84e355a95780c17c95e.
Joint preregistration before any upgrade branch: https://github.com/j4groupfounders/j4-upgrades-harness/commit/b7b853919779e2e5780774da7815b996dff12d45.
Frozen baseline SHA d910d4f1fc36275ca9102e4e1911a29346da8708; https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37727262626.

## Verdict
Seed detection criterion failed or infrastructure incomplete; no green claimed.
Baseline: 85 tests, 0 skips. Accepted upgrades require unchanged named test inventory and no new skips.
Upgrade: https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37728399456.
Seeds: https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37728639387.
Project detections 4/5; combined 4/5; all seed infrastructure clean=True.
Batch 6 scoring retained: >=4/5 combined AND combined misses <=half project misses; infrastructure failures never count.
8 workflow runs (cap 12 including baselines), 17.12 actual job-minutes. Five separate fresh-checkout seed jobs. Explicit pipefail, public standard Linux Actions only.
Zero human app/test logic edits. No paid APIs/services, no model API calls by scripts, no customer/upstream contact. Session token cost unavailable, not claimed as zero measured cost.

## Migration, repairs, and limits
Baseline retains Rails 7.0.4 and Ruby 3.1.2 with original stable Gemfile.lock. Harness loads every existing *_test.rb and adds a JUnit reporter; first baseline failed because reporter output directory did not exist, corrected in harness only. 85 named tests, zero skips. External HTTP snapshots are five unauthenticated static/login pages; authenticated social behavior remains covered by existing tests, not frozen external replay. No browser tests exist in upstream system directory.
Migration so far: Ruby 3.1.2→3.2.9, Rails 7.0.4→8.0.2, stable SQLite/ActiveStorage validators/Puma/Bootsnap/Minitest companion upgrades. Removed Rails disallowed-deprecation setters, mapped show_exceptions false to :none, selected supported cache format 7.1. First major run exposed removed ActiveSupport proxy classes used by Jbuilder 2.11.5; upgraded to 2.13.0. Tests and app model/controller logic unchanged so far.
Second run booted and preserved HTTP, but JSON 3.0.2 removed quirks_mode used by Rails 8.0.2 session serialization. Added stable JSON 2.10.2 constraint; no session/test logic changes.
Accepted clean-checkout frozen dependency replay 37728399456 preserved the exact committed lock bytes, complete named test inventory and all frozen HTTP snapshots. No classified HTTP changes needed. All application/test logic remains unchanged apart from Symfony route-import namespace migration; agent dependency/runtime/config repairs only.
FINAL RED despite a successful major migration: project and combined detection both 4/5. Dropped email lowercasing escaped all preregistered tests/HTTP. Combined miss rate 20% did not halve project miss rate 20% (required <=10%). No new probes or replacement fault added. Other four faults caused specific expected assertion failures; all five infrastructure=false. Eight total workflow runs.

See PREREG.md and immutable fault list in harness. Full existing project suite, five frozen unauthenticated HTTP routes. No overall coverage or production certification claim. Teaching/reference apps, not random customer selection.
Tests/fixtures are retained; all agent migration/config edits itemized in upgrade.patch. Symfony deprecation warnings excluded, not assertions. No post-hoc probes or changed faults.

## Seed outcomes
- 0: blank user name accepted — project=True, HTTP=False, combined=True, infrastructure=False; 
- 1: email normalization dropped — project=False, HTTP=False, combined=False, infrastructure=False; 
- 2: password expiration inverted — project=True, HTTP=False, combined=True, infrastructure=False; 
- 3: feed ordering reversed — project=True, HTTP=False, combined=True, infrastructure=False; 
- 4: unfollow becomes no-op — project=True, HTTP=False, combined=True, infrastructure=False; 

## All CI runs
- https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37726875145 — j4/p2g-baseline, failure, 1.57 job-min, SHA 917ca9990ce906836b26565d2a16f49aa754bf42.
- https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37727100240 — j4/p2g-baseline, success, 1.65 job-min, SHA 7890e5405c2d6a17acb9c5b00b9809fa69d4382d.
- https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37727262626 — j4/p2g-baseline, success, 1.62 job-min, SHA d910d4f1fc36275ca9102e4e1911a29346da8708.
- https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37727560547 — j4/p2g-upgrade, failure, 0.80 job-min, SHA 6a71253ec552a37c5db5b8836114689d3505f71d.
- https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37727832536 — j4/p2g-upgrade, failure, 1.72 job-min, SHA 8b03d93b5bf43f42072f826a6a0f9f31c614f103.
- https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37728128191 — j4/p2g-upgrade, success, 1.65 job-min, SHA ed29527dc5a5fcca9d35efa7e429275104ce7432.
- https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37728399456 — j4/p2g-upgrade, success, 1.37 job-min, SHA 9bf64eeaa1c5836cffba2125abbd2d646f09eed2.
- https://github.com/j4groupfounders/j4-p2g-sample-app/actions/runs/37728639387 — j4/p2g-seeds, success, 6.75 job-min, SHA 20086c8f5f8910dfde16df4727546ab482fa7ef1.

## Upgrade diff scope

.github/workflows/j4-p2g.yml       |   4 +-
 Gemfile                            |  19 +-
 Gemfile.lock                       | 386 +++++++++++++++++++++----------------
 config/application.rb              |   1 +
 config/environments/development.rb |   2 -
 config/environments/test.rb        |   4 +-
 6 files changed, 237 insertions(+), 179 deletions(-)
