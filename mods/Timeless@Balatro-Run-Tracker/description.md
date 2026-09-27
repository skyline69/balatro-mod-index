# Run Tracker

Records every run you finish and puts it on a shared leaderboard at
[balatro-run-tracker.timelessc.workers.dev](https://balatro-run-tracker.timelessc.workers.dev),
where you can browse and filter everyone's runs — by seed, deck, stake, blind,
ante, joker, or player.

Install it and play. There is nothing to configure, no account, and no key to
paste. It changes nothing about how the game plays: it reads the run once it is
already over.

## What it records

**Per run:** the seed, win or loss, the ante and round you reached, the blind
you died on with your score against its target and the percentage, deck, stake,
best hand, hands played and skips.

**Round by round:** what each blind asked for and what you actually scored, as a
chart. Blinds you skipped keep their column, marked, so the shape of the run
stays honest.

**Every joker that passed through your row** — not just the ones you finished
with — in the order you got them, with how many rounds each one stayed. The ones
you were still holding at the end are marked.

**Vouchers**, in the order you redeemed them, with the ante. Ones that came from
a Voucher Tag are marked separately, since you did not pay for those.

**Where your money went:** what you earned and what you spent, broken down by
source. On the way in: blind rewards, interest, unused hands and discards,
jokers, gold cards and seals, lucky cards, tags, consumables, sales. On the way
out: shop, rerolls, boss rerolls, rental upkeep, and the per-discard charge some
challenges apply. If something cannot be attributed it shows as "Other" rather
than being quietly folded into a category it does not belong to.

**Per joker:** name, edition, what it was actually contributing at the end
(`Hologram x4.25`, `Green Joker +34`, `Bull +186 chips`), and its **eternal**,
**perishable** or **rental** sticker.

**Poker hands:** the level of each one and how many times you played it.

```
2026-08-16 19:19 | LOSE | EQ357UN1 | Ante 5 | Round 15 | The Arm
Pts 36632/50000 (73.3%) | Nebula Deck, Gold Stake | Best hand: 28080
Green Joker [eternal] +34, Square Joker [rental] +28 chips, Hologram x2.25
```

## Base game only

Runs that included a joker from another mod are skipped, so the board only ever
compares base-game play. The check runs against the list of the 150 vanilla
jokers and catches modded ones even if you sold them before the run ended. Runs
on a deck from another mod are kept in your local files but not uploaded.

## Your name

You appear as a name plus a four-digit tag, like `TimelessC1#3665`, so two
players called the same thing never get mixed up. The tag is generated once and
kept in a file outside the mod folder, so it survives reinstalling.

The name comes from your Steam name or your Balatro profile name, and you can
type your own in the config tab.

## Privacy

- **Your SteamID is never sent.** What identifies you is a hash of it that
  cannot be turned back into your account.
- **Uploading can be switched off** in the config tab, and the mod tells you
  once, on first launch, that it is recording and where the data goes.
- Every run is also written to `run_tracker_results.txt` in your Balatro save
  folder, whether it uploads or not. If an upload fails it is queued and
  retried next time you start the game.

## Extra logs

Want to measure just one month, a challenge, or a streak? In the config tab,
type a name under **Extra log** and press **Start**. From then on every finished
run is written twice: to the usual `run_tracker_log.jsonl` and to
`run_tracker_log_<your name>.jsonl`. Press **Stop** to close it — the file keeps
exactly the runs you played while it was open, ready to drop into the **My
stats** tab of the site, which reads your own file in your browser and uploads
nothing.

The main log always records everything, whatever you do with the extra ones.

## Requirements

Steamodded 1.0.0-beta or newer, and Lovely Injector. Works with Balatro 1.0.1.
