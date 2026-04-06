-- Run this in Supabase SQL Editor to create the expenses table

CREATE TABLE expenses (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  student_id text NOT NULL,
  amount numeric NOT NULL DEFAULT 0,
  notes text,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'paid')),
  created_at timestamptz DEFAULT now(),
  paid_at timestamptz
);

-- Enable RLS
ALTER TABLE expenses ENABLE ROW LEVEL SECURITY;

-- Full access policy (matching existing tables' pattern)
CREATE POLICY "Full access" ON expenses FOR ALL USING (true) WITH CHECK (true);
