
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Mohammed Alhaijamy','mohammed@alhaijmay.com','alhaijamy' ,'MOCK'),
  ('Ahmed Alhaijamy', 'ahmed@alhaijamy.com','ahmed' ,'MOCK'),
  ('Harry Potter', 'harry@alhaijamy.com','harry' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'alhaijamy' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )
  