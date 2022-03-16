-- Query untuk Proyek dari Cabang A dqlab
SELECT kode_pelanggan, nama_produk, qty, harga, qty*harga AS total FROM tr_penjualan WHERE qty*harga >= 100000 ORDER BY total DESC;