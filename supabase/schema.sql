-- Supabase SQL Editor üzerinde bir kez çalıştırın.
create table if not exists public.records (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  university text not null check (university in ('ata','ana','ist')),
  category text not null check (category in ('courses','exams','grades','waivers','tasks','payments')),
  name text not null check (char_length(name) between 1 and 200),
  detail text not null default '' check (char_length(detail) <= 500),
  event_date date,
  created_at timestamptz not null default now()
);
create index if not exists records_owner_idx on public.records(user_id,created_at desc);
alter table public.records enable row level security;
revoke all on public.records from anon;
grant select,insert,update,delete on public.records to authenticated;
drop policy if exists "read own" on public.records;
drop policy if exists "insert own" on public.records;
drop policy if exists "update own" on public.records;
drop policy if exists "delete own" on public.records;
create policy "read own" on public.records for select to authenticated using ((select auth.uid())=user_id);
create policy "insert own" on public.records for insert to authenticated with check ((select auth.uid())=user_id);
create policy "update own" on public.records for update to authenticated using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
create policy "delete own" on public.records for delete to authenticated using ((select auth.uid())=user_id);
