ALTER TABLE "user" RENAME TO base_user;
ALTER TABLE base_user ADD UNIQUE (email);
ALTER TABLE base_user ALTER COLUMN first_name SET NOT NULL;
ALTER TABLE base_user ALTER COLUMN last_name SET NOT NULL;
ALTER TABLE base_user ALTER COLUMN email SET NOT NULL;
ALTER TABLE base_user ALTER COLUMN phone SET NOT NULL;

ALTER TABLE business_profile
DROP CONSTRAINT "business_profile_user_id_fkey",
ADD CONSTRAINT "business_profile_user_id_fkey"
FOREIGN KEY (user_id) REFERENCES base_user(user_id) ON DELETE CASCADE;

ALTER TABLE investor_profile
DROP CONSTRAINT "investor_profile_user_id_fkey",
ADD CONSTRAINT "investor_profile_user_id_fkey"
FOREIGN KEY (user_id) REFERENCES base_user(user_id) ON DELETE CASCADE;