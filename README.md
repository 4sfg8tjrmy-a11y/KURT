# KURT Akademi
Üç üniversite için bağımsız, mobil uyumlu öğrenci takip uygulaması.

## Durum
Bu depo Vercel'de yayınlanabilecek statik bir web uygulaması içerir. Supabase Auth + PostgreSQL veritabanı ile giriş ve cihazlar arası senkronizasyon destekler. **Henüz canlıya alınmış veya Supabase'e bağlanmış değildir.**

## Kurulum
1. Supabase'de yeni proje oluşturun.
2. SQL Editor'da `supabase/schema.sql` dosyasını çalıştırın. Row Level Security etkin kalmalıdır.
3. Supabase Authentication > Providers bölümünde Email'i yapılandırın; e-posta doğrulamasını etkin tutun.
4. Vercel'de GitHub deposunu import edip Framework Preset olarak Other seçin. Root Directory: proje kökü; build komutu gerekmez.
5. Yayınlanan adreste Supabase Project URL ve **publishable/anon** anahtarını girin. **service_role veya secret anahtarını asla tarayıcıya girmeyin.**
6. E-posta hesabıyla kayıt olup giriş yapın.

## Güvenlik
Kişisel kayıtlar veritabanında kullanıcı ID'sine bağlıdır ve RLS ile sınırlandırılır. Repo içine şifre, kişisel veri veya gizli anahtar eklemeyin. Supabase publishable/anon key gizli anahtar değildir. Giriş güvenliği için Supabase'de MFA ve rate limits ayarlanabilir.

## Sınırlar
Başlangıç sürümü temel CRUD, JSON yedek ve kategori yönetimi içerir. Önceki notlar henüz aktarılmadı; sınav takvimleri otomatik çekilmiyor. Test ve güvenlik denetimi yapılmadan hassas veri yüklemeyin.
