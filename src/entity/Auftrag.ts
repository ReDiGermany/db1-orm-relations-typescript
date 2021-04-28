import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
  OneToOne,
  OneToMany,
} from "typeorm";
import { Addresse } from "./Adresse";
import { AuftragsPos } from "./AuftragsPos";
import { Kunde } from "./Kunde";
@Entity()
export class Auftrag {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  datum: Date;

  @Column()
  lieferdatum: Date;

  @ManyToOne((type) => Kunde, (kunde) => kunde.id)
  kunde: Kunde;

  @OneToOne((type) => Addresse)
  @JoinColumn()
  rechnungs_adresse: Addresse;

  @OneToOne((type) => Addresse)
  @JoinColumn()
  liefer_adresse: Addresse;

  @OneToMany((type) => AuftragsPos, (auftrag) => auftrag.position)
  position: AuftragsPos[];
}
