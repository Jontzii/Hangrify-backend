/*
  Warnings:

  - You are about to alter the column `token` on the `Token` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - Added the required column `lastAccess` to the `Token` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Token" ADD COLUMN     "deactivationDate" TIMESTAMP(3),
ADD COLUMN     "lastAccess" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "token" SET DATA TYPE VARCHAR(128);
