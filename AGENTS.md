# Agent Startup Rules

## Prioritas Konteks
1. Sebelum melakukan pekerjaan apa pun, baca `WORKLOG.md` dan gunakan entry paling atas sebagai konteks terakhir.
2. Jika ada konflik antara percakapan terbaru dan `WORKLOG.md`, prioritaskan instruksi terbaru dari user.

## Format Wajib WORKLOG
1. Setiap entry wajib ringkas dan hanya berisi:
   - `When`
   - `Done` (maksimal 5 bullet)
   - `Next` (maksimal 3 bullet)
   - `Ref` (opsional: commit/PR/issue)
2. Hindari narasi panjang, detail command remeh, dan informasi sensitif.

## Batas Panjang Dan Rotasi
1. `WORKLOG.md` hanya boleh menyimpan 20 entry terbaru.
2. Jika entry baru membuat total > 20, pindahkan entry tertua ke arsip bulanan:
   - `docs/worklog-archive/YYYY-MM.md`
3. Jika `WORKLOG.md` melewati 300 baris, ringkas entry lama lalu arsipkan sampai kembali di bawah batas.

## Kedisiplinan Update
1. Setelah menyelesaikan pekerjaan, update `WORKLOG.md` di bagian paling atas.
2. Fokus pada outcome dan keputusan, bukan proses panjang.
