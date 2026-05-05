<?php
require_once 'wp-load.php';
require_once ABSPATH . 'wp-admin/includes/image.php';
require_once ABSPATH . 'wp-admin/includes/file.php';
require_once ABSPATH . 'wp-admin/includes/media.php';

$images = [
    'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=1920&q=80', // Luxury Necklace
    'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=1920&q=80', // Luxury Rings
    'https://images.unsplash.com/photo-1599643477877-537ef527852b?w=1920&q=80'  // Diamond Jewelry
];

$titles = ['Trang sức Kim cương Cao cấp', 'Bộ sưu tập Nhẫn cưới', 'Dây chuyền Quý phái'];

foreach ($images as $index => $url) {
    // Create Post
    $post_id = wp_insert_post([
        'post_title'    => $titles[$index],
        'post_content'  => 'Mẫu trang sức cao cấp mới nhất từ Velmora Jewelry.',
        'post_status'   => 'publish',
        'post_type'     => 'post', // Loop Carousel usually pulls from posts or products
    ]);

    if ($post_id) {
        // Sideload Image
        $tmp = download_url($url);
        $file_array = [
            'name'     => basename($url) . '.jpg',
            'tmp_name' => $tmp
        ];

        if (!is_wp_error($tmp)) {
            $id = media_handle_sideload($file_array, $post_id);
            if (!is_wp_error($id)) {
                set_post_thumbnail($post_id, $id);
                echo "SUCCESS: Added post and image " . ($index + 1) . "\n";
            }
        }
    }
}
echo "ALL DONE: 3 new items with high-quality images added to your carousel.\n";
